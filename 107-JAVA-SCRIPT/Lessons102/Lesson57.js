class Car {
    static numberOfCars = 0
    #currentSpeed
    constructor(name, color, currentSpeed) {
        this.name = name
        this.color = color
        this.#currentSpeed = currentSpeed
        Car.incrementNumberOfCars()
    }
    move(speed) {
        this.#currentSpeed = speed
        return `The ${this.name} is moving at speed of ${this.#currentSpeed}km per hour`
    }
    stop() {
        this.#currentSpeed = 0
        return `The ${this.name} stopped`
    }
    static incrementNumberOfCars() {
        Car.numberOfCars++
    }
}
const car = new Car('Camry', 'white', 0)
console.log(car.move(100));
console.log(car)
