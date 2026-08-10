# 🚗✈️ مشروع شركة مواصلات

## 📌 فكرة المشروع

شركة مواصلات تريد تطبيق يساعدها على إسناد المركبات (سيارات أو طائرات) للموظفين المؤهلين (سائقين أو طيارين) حسب نوع المركبة، مع تسجيل كل عمليات الحجز.

**القاعدة الأساسية:**
- سائق → يُسند له **سيارة** فقط
- طيار → يُسند له **طائرة** فقط

---

## 🏗️ الكلاسات المستخدمة

| Class | يرث من | الخصائص |
|---|---|---|
| `Vehicles` | — | `id`, `name`, `company` |
| `Car` | `Vehicles` | + `carType` (gas / electric) |
| `Airplane` | `Vehicles` | + `airplaneType` |
| `Employee` | — | `id`, `name`, `dateOfBirth` |
| `Driver` | `Employee` | + `licenseID` |
| `Pilot` | `Employee` | + `licenseID` |
| `Reservation` | — | `reservationID`, `reservationDate`, `employeeId`, `vehiclesId` |

---

## ⚙️ كيف يشتغل المشروع

1. تعريف الكلاسات السبعة أعلاه (الوراثة بين المركبات والموظفين).
2. إنشاء objects: سيارات وطائرات + سائقين وطيارين.
3. دالة `makeReservation()` تستقبل `employeeId` و `vehicleId`:
   - تتحقق هل الموظف والمركبة موجودين.
   - تتحقق من التوافق (سائق↔سيارة / طيار↔طائرة).
   - لو غير متوافق → تطبع رسالة خطأ.
   - لو متوافق → تنشئ `Reservation` جديد وتخزنه.
4. كل الحجوزات الناجحة تُحفظ داخل مصفوفة `Reservation.reserved`.
5. طباعة كل الحجوزات باستخدام `map()`.

---

## ✅ مخرجات التعلم

- التعامل مع OOP في JavaScript (Classes, Inheritance, `instanceof`).
- التعامل مع دوال الصفوفات (`map`, `find`).
- التعامل مع الدوال بشكل أعمق (Validation, Conditional Logic).

---

## ▶️ تشغيل المشروع

```bash
node transportCompany.js
```