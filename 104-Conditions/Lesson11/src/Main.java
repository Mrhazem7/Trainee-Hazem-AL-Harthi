import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Garage garage =new Garage();
        Scanner scanner = new Scanner(System.in);

        int choice = 0;

        do{

            System.out.println("Menu:");
            System.out.println("1. Add a vehicle");
            System.out.println("2. Update a vehicle");
            System.out.println("3. Remove a vehicle");
            System.out.println("4. Display vehicles");
            System.out.println("5. Display details of a vehicle");
            System.out.println("0. Exit");

            System.out.print("Enter your choice: ");
            choice= scanner.nextInt();