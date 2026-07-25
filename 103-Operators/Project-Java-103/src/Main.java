import java.io.PrintStream;
import java.nio.charset.StandardCharsets;

public class Main {
    public static void main(String[] args) {
        System.setOut(new PrintStream(System.out, true, StandardCharsets.UTF_8));

        Garage garage = new Garage();

        Car car1 = new Car("Genesis G80", 2026, "كوريا الجنوبية", 5);
        Car car2 = new Car("Mercedes-Benz", 2026, "ألمانيا", 5);
        Car car3 = new Car("BMW i7", 2026, "ألمانيا", 5);
        Car car4 = new Car("Mazda 6", 2026, "اليابان", 5);

        garage.addVehicle(car1);
        garage.addVehicle(car2);
        garage.addVehicle(car3);
        garage.addVehicle(car4);

        garage.displayAllVehicles();

        garage.removeVehicle("Mazda 6");

        garage.displayAllVehicles();
    }
}