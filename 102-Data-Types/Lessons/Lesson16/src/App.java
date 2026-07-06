public class App {
    public static void main(String[] args)  {
        try {
            System.out.println( 5 / 0);
        } catch ( ArithmeticException errot ) {
           System.out.println(" Do not divide by 0");
        }
    }
}
