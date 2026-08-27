# 🎯 Guess the Number Game

برنامج بسيط مكتوب بلغة **C++** على شكل لعبة تخمين رقم — اللاعب يحاول يخمن رقم سري بين 1 و10 بعدد أقل ما يمكن من المحاولات.

---

## ✨ المميزات

- ترحيب شخصي باسم اللاعب
- تلميحات تفاعلية ("أكبر" / "أصغر") بعد كل محاولة
- عدّاد يحسب عدد المحاولات لين يخمن الرقم صح
- كود منظم باستخدام **الدوال (Functions)**

---

## 🧠 المفاهيم المستخدمة

| المفهوم | الاستخدام بالمشروع |
|---|---|
| Functions | فصل الكود لدالتين: `showWelcome()` و `playGame()` |
| String | أخذ اسم اللاعب عن طريق `getline()` |
| Conditionals | مقارنة تخمين اللاعب بالرقم السري (`if / else if / else`) |
| Loops | تكرار السؤال لين يخمن صح (`do-while`) |

---

## ⚙️ طريقة الترجمة والتشغيل

### الترجمة (Compile)
```bash
g++ main.cpp -o game
```

### التشغيل (Run)
```bash
./game
```

> على ويندوز شغّل الأمر: `game.exe`

---

## 🕹️ مثال على التشغيل

```
Enter your name: Hazem
Welcome Hazem! Let's play Guess the Number.
I'm thinking of a number between 1 and 10.
Enter your guess: 5
Too low! Try again.
Enter your guess: 8
Too high! Try again.
Enter your guess: 7
Correct! You guessed it in 3 attempts.
```
---

## 📁 هيكل المشروع

```
.
├── main.cpp        # الكود المصدري للعبة
├── README.md       # هذا الملف
└── screenshot.png  # لقطة شاشة توضح البرنامج وهو يعمل
```