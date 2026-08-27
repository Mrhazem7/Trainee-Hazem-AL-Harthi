"""
الاستثناءات المخصصة (Custom Exceptions) الخاصة بتطبيق منظم الملفات.

كل استثناء يمثل حالة خطأ متوقعة يمكن أن تحدث أثناء تشغيل البرنامج،
بحيث يتم التقاطها والتعامل معها بشكل واضح بدل انهيار البرنامج فجأة.
"""


class FileOrganizerError(Exception):
    """الاستثناء الأساسي الذي ترث منه جميع استثناءات التطبيق."""
    pass


class InvalidDirectoryError(FileOrganizerError):
    """يُرفع عندما يكون المسار المُدخل غير موجود أو ليس مجلدًا."""
    pass


class EmptyDirectoryError(FileOrganizerError):
    """يُرفع عندما لا يوجد أي ملفات قابلة للتنظيم داخل المجلد المحدد."""
    pass


class ConfigError(FileOrganizerError):
    """يُرفع عند وجود مشكلة في قراءة أو تحليل ملف الإعدادات config.json."""
    pass


class LogError(FileOrganizerError):
    """يُرفع عند وجود مشكلة في قراءة أو كتابة ملف سجل العمليات."""
    pass


class UndoError(FileOrganizerError):
    """يُرفع عند تعذر تنفيذ عملية التراجع (مثلاً لا يوجد عملية سابقة)."""
    pass
