"""
كلاس FileOrganizer
المسؤول الرئيسي عن تنفيذ عملية "تنظيم" المجلد: يفحص الملفات الموجودة،
يستخدم FileClassifier لتحديد فئة كل ملف، وينقلها إلى مجلد فرعي مناسب،
مع تسجيل كل عملية عبر OperationLogger لدعم التراجع لاحقًا.
"""

import os
import shutil

from .classifier import FileClassifier
from .logger import OperationLogger
from .exceptions import InvalidDirectoryError, EmptyDirectoryError, UndoError


class FileOrganizer:
    """المنطق الأساسي لتنظيم الملفات داخل مجلد معيّن."""

    def __init__(self, classifier: FileClassifier, logger: OperationLogger):
        self.classifier = classifier
        self.logger = logger

    # ------------------------------------------------------------------ #
    # تنظيم المجلد
    # ------------------------------------------------------------------ #
    def organize(self, directory: str) -> dict:
        """
        ينظّم الملفات الموجودة مباشرة داخل 'directory' في مجلدات فرعية
        حسب نوعها، ويرجع تفاصيل الجلسة (الملفات المنقولة والمتجاوَزة).
        """
        if not os.path.exists(directory):
            raise InvalidDirectoryError(f"المسار غير موجود: {directory}")
        if not os.path.isdir(directory):
            raise InvalidDirectoryError(f"المسار المحدد ليس مجلدًا: {directory}")

        ignored_names = {
            os.path.basename(self.classifier.config_path),
            os.path.basename(self.logger.log_path),
        }

        entries = [
            name
            for name in os.listdir(directory)
            if os.path.isfile(os.path.join(directory, name))
            and not name.startswith(".")
            and name not in ignored_names
        ]

        if not entries:
            raise EmptyDirectoryError(f"لا توجد ملفات قابلة للتنظيم داخل: {directory}")

        moved_files = []
        skipped_files = []

        for name in entries:
            source_path = os.path.join(directory, name)
            category = self.classifier.classify(name)
            category_dir = os.path.join(directory, category)

            try:
                os.makedirs(category_dir, exist_ok=True)
                destination_path = self._unique_destination(category_dir, name)
                shutil.move(source_path, destination_path)
                moved_files.append(
                    {
                        "original_path": os.path.abspath(source_path),
                        "new_path": os.path.abspath(destination_path),
                        "category": category,
                    }
                )
            except (OSError, PermissionError, shutil.Error) as exc:
                # خطأ متوقع أثناء نقل ملف واحد (صلاحيات، ملف مستخدم من برنامج آخر...)
                # لا نوقف كامل العملية، فقط نسجل الملف كمتجاوَز ونكمل الباقي.
                skipped_files.append({"file": name, "reason": str(exc)})

        session = self.logger.save_session(moved_files, skipped_files, directory)
        return session

    @staticmethod
    def _unique_destination(category_dir: str, filename: str) -> str:
        """يتجنب الكتابة فوق ملف موجود بنفس الاسم بإضافة رقم متسلسل."""
        destination = os.path.join(category_dir, filename)
        if not os.path.exists(destination):
            return destination

        base, ext = os.path.splitext(filename)
        counter = 1
        while True:
            candidate = os.path.join(category_dir, f"{base}_{counter}{ext}")
            if not os.path.exists(candidate):
                return candidate
            counter += 1

    # ------------------------------------------------------------------ #
    # التراجع عن آخر عملية تنظيم
    # ------------------------------------------------------------------ #
    def undo_last(self) -> dict:
        """يرجع كل الملفات المنقولة في آخر جلسة إلى مكانها الأصلي."""
        session = self.logger.get_last_session()
        if session is None:
            raise UndoError("لا توجد أي عملية تنظيم سابقة للتراجع عنها.")

        restored = []
        failed = []
        touched_dirs = set()

        for entry in reversed(session["moved_files"]):
            new_path = entry["new_path"]
            original_path = entry["original_path"]
            touched_dirs.add(os.path.dirname(new_path))
            try:
                os.makedirs(os.path.dirname(original_path), exist_ok=True)
                shutil.move(new_path, original_path)
                restored.append(entry)
            except (OSError, PermissionError, shutil.Error) as exc:
                failed.append({"file": new_path, "reason": str(exc)})

        # محاولة حذف مجلدات الفئات إن أصبحت فارغة بعد التراجع (تنظيف تلقائي)
        for folder in touched_dirs:
            try:
                if os.path.isdir(folder) and not os.listdir(folder):
                    os.rmdir(folder)
            except OSError:
                pass  # المجلد ليس فارغًا أو محمي، لا مشكلة في تجاهله

        self.logger.remove_last_session()
        return {"restored": restored, "failed": failed, "session": session}
