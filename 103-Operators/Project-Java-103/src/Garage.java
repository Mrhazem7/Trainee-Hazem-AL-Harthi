import java.util.ArrayList;

class Garage {
    private ArrayList<Vehicle> vehicles = new ArrayList<>();

    
    public void addVehicle(Vehicle v) {
        vehicles.add(v);
        System.out.println("تمت إضافة المركبة: " + v.getModel());
    }

    public void removeVehicle(String model) {
        vehicles.removeIf(v -> v.getModel().equalsIgnoreCase(model));
        System.out.println("تم حذف المركبة: " + model);
    }

    public void removeVehicle(int index) {
        if (index >= 0 && index < vehicles.size()) {
            System.out.println("تم حذف المركبة: " + vehicles.get(index).getModel());
            vehicles.remove(index);
        }
    }

    public void displayAllVehicles() {
        System.out.println("\n--- المركبات الموجودة بالكراج ---");
        if (vehicles.isEmpty()) {
            System.out.println("الكراج فاضي حاليًا.");
            return;
        }
        for (Vehicle v : vehicles) {
            v.displayInfo(); 
        }
    }
}