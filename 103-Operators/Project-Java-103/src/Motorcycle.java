class Motorcycle extends Vehicle {
    private double engineCapacity;  

    public Motorcycle(String model, int year, String country, double engineCapacity) {
        super(model, year, country);
        this.engineCapacity = engineCapacity;
    }

    public double getEngineCapacity() {
        return engineCapacity;
    }
    public void setEngineCapacity(double engineCapacity) {
        this.engineCapacity = engineCapacity;
    }

    @Override
    void displayInfo() {
        System.out.println("دراجة نارية: " + getModel() + " | سنة: " + getYear()
                + " | بلد الصنع: " + getCountry() + " | سعة المحرك: " + engineCapacity + "cc");
    }
}