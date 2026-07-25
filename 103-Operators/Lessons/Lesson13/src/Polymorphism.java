class Greet {
    public void greet() {
        System.out.println("Hello");
    }
}

class ArabicGreet extends Greet {
    public void greet() {
        System.out.println("مرحبا");
    }
}

class SpanishGreet extends Greet {
    public void greet() {
        System.out.println("Hola");
    }
}

public class Polymorphism {
    public static void main(String[] args) {
        Greet greet = new Greet();
        greet.greet();

        ArabicGreet arabicGreet = new ArabicGreet();
        arabicGreet.greet();

        SpanishGreet spanishGreet = new SpanishGreet();
        spanishGreet.greet();
    }
}