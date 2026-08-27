"""
كلاس FileClassifier
المسؤول عن تصنيف الملفات إلى فئات (صور، مستندات، فيديوهات ... إلخ)
اعتمادًا على امتداد كل ملف، وذلك بقراءة خريطة الفئات من ملف config.json.
"""

import json
import os

from .exceptions import ConfigError

# الفئة الافتراضية التي توضع فيها الملفات غير المعروفة الامتداد
DEFAULT_CATEGORY = "أخرى"

# إعدادات افتراضية تُستخدم في حال عدم وجود ملف config.json إطلاقًا
DEFAULT_CATEGORIES = {
    "صور": [".jpg", ".jpeg", ".png", ".gif", ".bmp", ".svg", ".webp"],
    "مستندات": [".pdf", ".doc", ".docx", ".txt", ".xlsx", ".xls", ".pptx", ".csv", ".md"],
    "فيديوهات": [".mp4", ".mkv", ".avi", ".mov", ".wmv"],
    "صوتيات": [".mp3", ".wav", ".flac", ".aac"],
    "أرشيف": [".zip", ".rar", ".7z", ".tar", ".gz"],
    "أكواد": [".py", ".js", ".java", ".cpp", ".c", ".html", ".css", ".json"],
    DEFAULT_CATEGORY: [],
}


class FileClassifier:
    """يحدد الفئة (المجلد) المناسبة لكل ملف حسب امتداده."""

    def __init__(self, config_path="config.json"):
        self.config_path = config_path
        self.categories = self._load_config()

    def _load_config(self):
        """
        يقرأ ملف config.json ويحوّله إلى قاموس {فئة: [امتدادات]}.
        - إذا لم يكن الملف موجودًا: يتم إنشاؤه تلقائيًا بالإعدادات الافتراضية.
        - إذا كان الملف موجودًا لكن محتواه غير صالح (JSON تالف أو بنية غير متوقعة):
          يتم رفع ConfigError بدل انهيار البرنامج.
        """
        if not os.path.exists(self.config_path):
            self._write_default_config()
            return {k: list(v) for k, v in DEFAULT_CATEGORIES.items()}

        try:
            with open(self.config_path, "r", encoding="utf-8") as f:
                data = json.load(f)
        except json.JSONDecodeError as exc:
            raise ConfigError(
                f"ملف الإعدادات '{self.config_path}' تالف أو ليس بصيغة JSON صحيحة: {exc}"
            ) from exc
        except OSError as exc:
            raise ConfigError(
                f"تعذر فتح ملف الإعدادات '{self.config_path}': {exc}"
            ) from exc

        if not isinstance(data, dict) or not all(
            isinstance(v, list) for v in data.values()
        ):
            raise ConfigError(
                "بنية ملف الإعدادات غير صحيحة، يجب أن يكون بالشكل "
                '{"اسم_الفئة": [".امتداد1", ".امتداد2"]}'
            )

        if DEFAULT_CATEGORY not in data:
            data[DEFAULT_CATEGORY] = []

        return data

    def _write_default_config(self):
        with open(self.config_path, "w", encoding="utf-8") as f:
            json.dump(DEFAULT_CATEGORIES, f, ensure_ascii=False, indent=4)

    def classify(self, filename: str) -> str:
        """يرجع اسم الفئة (المجلد) التي ينتمي إليها الملف بناءً على امتداده."""
        _, ext = os.path.splitext(filename)
        ext = ext.lower()

        for category, extensions in self.categories.items():
            if ext in [e.lower() for e in extensions]:
                return category

        return DEFAULT_CATEGORY

    def get_categories(self) -> dict:
        """يرجع نسخة من قاموس الفئات الحالية (للعرض فقط)."""
        return {k: list(v) for k, v in self.categories.items()}
