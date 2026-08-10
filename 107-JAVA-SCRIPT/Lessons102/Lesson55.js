class Car {
    constructor(name, color, currentSpeed) {
        this.name = name
        this.color = color
        this.currentSpeed = currentSpeed
    }
    move(speed) {
        this.currentSpeed = speed
        return `The ${this.name} is moving at speed of ${this.currentSpeed}km per hour`
    }
    stop() {
        this.currentSpeed = 0
        return `The ${this.name} stopped`
    }
}

const car1 = new Car('camry', 'white', 0)
const car2 = new Car('corella', 'black', 0)
console.log(car1.move(50))
console.log(car2.move(70))
