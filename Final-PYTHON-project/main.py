#!/usr/bin/env python3
"""
منظم الملفات (File Organizer) - واجهة سطر الأوامر (CLI)

تطبيق بسيط بأسلوب البرمجة الكائنية (OOP) يقوم بتنظيم ملفات أي مجلد
إلى مجلدات فرعية حسب نوع الملف (صور، مستندات، فيديوهات ...)، مع حفظ
سجل بكل عملية على شكل ملف JSON، وإمكانية التراجع عن آخر عملية تنظيم.

طريقة التشغيل:
    python main.py
"""

import os

from file_organizer import (
    FileClassifier,
    OperationLogger,
    FileOrganizer,
    FileOrganizerError,
)

CONFIG_PATH = "config.json"
LOG_PATH = "organizer_log.json"

MENU_TEXT = """
==============================
        منظم الملفات
==============================
1) تنظيم مجلد
2) التراجع عن آخر عملية تنظيم
3) عرض سجل العمليات السابقة
4) عرض فئات التصنيف الحالية
5) خروج
==============================
"""


def print_session_summary(session: dict):
    moved = session.get("moved_files", [])
    skipped = session.get("skipped_files", [])

    print(f"\nتم نقل {len(moved)} ملف بنجاح:")
    for item in moved:
        print(f"   - {os.path.basename(item['original_path'])}  ->  {item['category']}/")

    if skipped:
        print(f"\nتعذر نقل {len(skipped)} ملف:")
        for item in skipped:
            print(f"   - {item['file']}  (السبب: {item['reason']})")


def action_organize(organizer: FileOrganizer):
    directory = input("أدخل مسار المجلد المراد تنظيمه: ").strip()
    if not directory:
        print("لم يتم إدخال أي مسار.")
        return

    session = organizer.organize(directory)
    print_session_summary(session)


def action_undo(organizer: FileOrganizer):
    confirm = input("هل تريد التراجع عن آخر عملية تنظيم؟ (y/n): ").strip().lower()
    if confirm != "y":
        print("تم إلغاء العملية.")
        return

    result = organizer.undo_last()
    restored = result["restored"]
    failed = result["failed"]

    print(f"\nتم إرجاع {len(restored)} ملف إلى مكانه الأصلي.")
    if failed:
        print(f"تعذر إرجاع {len(failed)} ملف:")
        for item in failed:
            print(f"   - {item['file']}  (السبب: {item['reason']})")


def action_show_history(logger: OperationLogger):
    history = logger.load_history()
    if not history:
        print("لا يوجد أي سجل عمليات حتى الآن.")
        return

    print(f"\nعدد عمليات التنظيم المسجّلة: {len(history)}\n")
    for i, session in enumerate(history, start=1):
        moved_count = len(session.get("moved_files", []))
        skipped_count = len(session.get("skipped_files", []))
        print(
            f"{i}) {session['timestamp']} | المجلد: {session['source_directory']} "
            f"| منقول: {moved_count} | متجاوَز: {skipped_count}"
        )


def action_show_categories(classifier: FileClassifier):
    categories = classifier.get_categories()
    print("\nفئات التصنيف الحالية (من config.json):\n")
    for category, extensions in categories.items():
        ext_text = ", ".join(extensions) if extensions else "(كل الامتدادات غير المصنفة)"
        print(f"   - {category}: {ext_text}")


def main():
    try:
        classifier = FileClassifier(CONFIG_PATH)
        logger = OperationLogger(LOG_PATH)
    except FileOrganizerError as exc:
        # خطأ متوقع أثناء الإقلاع (مثلاً ملف config.json تالف): نعرض رسالة
        # واضحة ونوقف البرنامج بدل أن ينهار بتتبع خطأ (traceback) مخيف.
        print(f"تعذر تشغيل البرنامج: {exc}")
        return

    organizer = FileOrganizer(classifier, logger)

    actions = {
        "1": lambda: action_organize(organizer),
        "2": lambda: action_undo(organizer),
        "3": lambda: action_show_history(logger),
        "4": lambda: action_show_categories(classifier),
    }

    while True:
        print(MENU_TEXT)
        choice = input("اختر رقم العملية: ").strip()

        if choice == "5":
            print("إلى اللقاء!")
            break

        action = actions.get(choice)
        if action is None:
            print("خيار غير صحيح، الرجاء اختيار رقم من 1 إلى 5.")
            continue

        try:
            action()
        except FileOrganizerError as exc:
            # جميع الأخطاء المتوقعة في التطبيق (مسار غير صحيح، مجلد فارغ،
            # ملف إعدادات تالف، لا يوجد عملية للتراجع عنها ...) تُعرض برسالة واضحة.
            print(f"\nخطأ: {exc}")
        except KeyboardInterrupt:
            print("\nتم إيقاف العملية من قبل المستخدم.")
        except Exception as exc:  # حماية إضافية من أي خطأ غير متوقع
            print(f"\nحدث خطأ غير متوقع: {exc}")


if __name__ == "__main__":
    main()
