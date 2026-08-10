const car1 = {
    name: 'camry',
    color: 'white',
    currentSpeed: 0,
    move: function(speed) {
      this.currentSpeed = speed
      return `The ${this.name} is moving at speed of ${this.currentSpeed}km per hour`
    },
    stop: function() {
        this.currentSpeed = 0
        return `The ${this.name} stopped`
    }
}

const car2 = {
    name: 'Corolla',
    color: 'black',
    currentSpeed: 0,
    move: function(speed) {
      this.currentSpeed = speed
      return `The ${this.name} is moving at speed of ${this.currentSpeed}km per hour`
    },
    stop: function() {
        this.currentSpeed = 0
        return `The ${this.name} stopped`
    }
}