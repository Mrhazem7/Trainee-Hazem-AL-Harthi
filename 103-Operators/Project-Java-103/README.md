# نظام إدارة مركبات 🚗🏍️🚚

## نبذة عن المشروع
برنامج بسيط بلغة Java يقوم بإدارة وتخزين المركبات (سيارات، دراجات نارية، شاحنات) داخل كراج، مع تطبيق كامل لمبادئ البرمجة الكائنية (OOP) الأربعة.

## المتطلبات المنفذة

### 1. Vehicle Registration
- تعريف دوال لإضافة وحذف المركبات من البرنامج
- تخزين معلومات خاصة بكل مركبة (موديل، سنة الإصدار، بلد الصنع)

### 2. Classes for each Vehicle Type
- Class لكل نوع من المركبات (Car, Motorcycle, Truck)
- عناصر خاصة لكل Class (عدد المقاعد للسيارات، سعة المحرك للدراجات، سعة التحميل للشاحنات)

### 3. Garage Management
- تخزين المركبات داخل الكراج
- عرض جميع المركبات الموجودة حاليًا بالكراج

## تطبيق مبادئ OOP

| المبدأ | التطبيق |
|---|---|
| **Encapsulation** | استخدام `private` للحقول في `Vehicle`، مع `getters` و `setters` |
| **Abstraction** | كلاس `Vehicle` مجرد (`abstract`) مع دالة `displayInfo()` |
| **Inheritance** | `Car`, `Motorcycle`, `Truck` ترث من `Vehicle` |
| **Polymorphism** | Override لدالة `displayInfo()` بكل كلاس فرعي، وOverloading لدوال الحذف في `Garage` |

## طريقة التشغيل

1. افتح المشروع في VS Code
2. تأكد من تثبيت JDK (يمكن التحقق بكتابة `java -version` في الـ Terminal)
3. افتح ملف `Main.java`
4. اضغط زر **Run ▷** أعلى الملف

أو عبر الـ Terminal:
```bash
cd src
javac *.java
java Main
```

## ملاحظة
في حال ظهور رموز غريبة بدل النصوص العربية عند التشغيل، اكتب هذا الأمر في الـ Terminal قبل التشغيل:
chcp 65001  اكتب