class Car extends Vehicle {
    private int seatingCapacity;

    public Car(String model, int year, String country, int seatingCapacity) {
        super(model, year, country);
        this.seatingCapacity = seatingCapacity;
    }

    public int getSeatingCapacity() {
        return seatingCapacity;
    }
    public void setSeatingCapacity(int seatingCapacity) {
        this.seatingCapacity = seatingCapacity;
    }

    
    @Override
    void displayInfo() {
        System.out.println("سيارة: " + getModel() + " | سنة: " + getYear()
                + " | بلد الصنع: " + getCountry() + " | عدد المقاعد: " + seatingCapacity);
    }
}