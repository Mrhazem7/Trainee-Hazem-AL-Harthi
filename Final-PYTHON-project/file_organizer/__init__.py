"""
حزمة file_organizer
تحتوي على الكلاسات الأساسية لتطبيق "منظم الملفات":
    - FileClassifier : تصنيف الملفات حسب الامتداد
    - OperationLogger : تسجيل عمليات النقل (لدعم التراجع وعرض السجل)
    - FileOrganizer   : المنطق الرئيسي لتنظيم مجلد
    - الاستثناءات المخصصة في exceptions.py
"""

from .exceptions import (
    FileOrganizerError,
    InvalidDirectoryError,
    EmptyDirectoryError,
    ConfigError,
    LogError,
    UndoError,
)
from .classifier import FileClassifier
from .logger import OperationLogger
from .organizer import FileOrganizer

__all__ = [
    "FileOrganizerError",
    "InvalidDirectoryError",
    "EmptyDirectoryError",
    "ConfigError",
    "LogError",
    "UndoError",
    "FileClassifier",
    "OperationLogger",
    "FileOrganizer",
]
