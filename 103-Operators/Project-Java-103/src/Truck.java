class Truck extends Vehicle {
    private double loadCapacity; 

    public Truck(String model, int year, String country, double loadCapacity) {
        super(model, year, country);
        this.loadCapacity = loadCapacity;
    }

    public double getLoadCapacity() {
        return loadCapacity;
    }
    public void setLoadCapacity(double loadCapacity) {
        this.loadCapacity = loadCapacity;
    }

    @Override
    void displayInfo() {
        System.out.println("شاحنة: " + getModel() + " | سنة: " + getYear()
                + " | بلد الصنع: " + getCountry() + " | سعة التحميل: " + loadCapacity + " طن");
    }
}