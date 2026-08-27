"""
كلاس OperationLogger
المسؤول عن حفظ سجل عمليات التنظيم في ملف JSON على القرص (organizer_log.json)،
وقراءته لاحقًا لعرض السجل أو لتنفيذ عملية التراجع (Undo).
"""

import json
import os
from datetime import datetime

from .exceptions import LogError


class OperationLogger:
    """يقرأ ويكتب سجل عمليات النقل من/إلى ملف JSON."""

    def __init__(self, log_path="organizer_log.json"):
        self.log_path = log_path

    def load_history(self) -> list:
        """
        يرجع قائمة بكل الجلسات (عمليات التنظيم) المسجّلة سابقًا.
        يرجع قائمة فارغة إذا لم يكن ملف السجل موجودًا بعد.
        يرفع LogError إذا كان الملف موجودًا لكن محتواه تالف.
        """
        if not os.path.exists(self.log_path):
            return []

        try:
            with open(self.log_path, "r", encoding="utf-8") as f:
                content = f.read().strip()
                if not content:
                    return []
                data = json.loads(content)
        except json.JSONDecodeError as exc:
            raise LogError(
                f"ملف السجل '{self.log_path}' تالف ولا يمكن قراءته: {exc}"
            ) from exc
        except OSError as exc:
            raise LogError(f"تعذر فتح ملف السجل '{self.log_path}': {exc}") from exc

        if not isinstance(data, list):
            raise LogError("بنية ملف السجل غير متوقعة (يجب أن تكون قائمة جلسات).")

        return data

    def _save_history(self, history: list):
        try:
            with open(self.log_path, "w", encoding="utf-8") as f:
                json.dump(history, f, ensure_ascii=False, indent=4)
        except OSError as exc:
            raise LogError(f"تعذر الكتابة في ملف السجل '{self.log_path}': {exc}") from exc

    def save_session(self, moved_files: list, skipped_files: list, source_directory: str) -> dict:
        """يضيف جلسة تنظيم جديدة إلى نهاية السجل ويحفظها في الملف، ويرجع الجلسة المُسجّلة."""
        history = self.load_history()

        session = {
            "timestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "source_directory": os.path.abspath(source_directory),
            "moved_files": moved_files,
            "skipped_files": skipped_files,
        }
        history.append(session)
        self._save_history(history)
        return session

    def get_last_session(self):
        """يرجع آخر جلسة مسجّلة، أو None إذا كان السجل فارغًا."""
        history = self.load_history()
        if not history:
            return None
        return history[-1]

    def remove_last_session(self):
        """يحذف آخر جلسة من السجل بعد التراجع عنها بنجاح."""
        history = self.load_history()
        if history:
            history.pop()
            self._save_history(history)
