import java.util.Scanner;
import java.util.Locale;
public class App {
    public static void main(String[] args)  {
        System.out.println("Hello Welcome To The BMI Calculator");

        Scanner input = new Scanner(System.in);
        input.useLocale(Locale.US) ;

        System.out.println("Please Enter Your Height:") ;
        double height = input.nextDouble();

        System.out.println("Please Enter Your Weight :") ;
        double weight = input.nextDouble() ;

        double bmi = weight / (height * height) ;
        System.out.println("Your BMI is : " + bmi) ;

        if (bmi < 18.5) {
            System.out.println("You are Underweight") ;
        } else if (bmi >= 18.5 && bmi <= 24.9) {
            System.out.println("You are Normal Weight") ;
        } else if (bmi >= 25 && bmi <= 29.9) {
            System.out.println("You are Overweight") ;
        } else {
            System.out.println("You are Obese") ; 


        System.out.println("Please Enter Your bmi :") ;
        double bmi1 = input.nextDouble() ; 
        
        final double vatRate = 0.15 ;

        double vatAmount = bmi1 * vatRate ;
        double totalAmount = bmi1 + vatAmount ;

        System.out.println("Your BMI is : " + bmi1) ;
        System.out.println("VAT Amount : " + vatAmount) ;
        System.out.println("Total Amount : " + totalAmount) ;
        


        
        }
        
    
    
    
    
    
    }   
}
