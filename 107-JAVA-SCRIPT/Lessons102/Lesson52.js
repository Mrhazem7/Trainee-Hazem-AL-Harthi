// let name = 'camry'
// let color = 'white'
// let currentSpeed = 0
// function move(speed) {
//   currentSpeed = speed
//   return `The ${name} is moving at speed of ${currentSpeed}km per hour`
// }
// function stop() {
//   currentSpeed = 0
//   return `The ${name} stopped`
// }
const car = {
    name: 'camry',
    color: 'white',
    currentSpeed: 0,
    move: function(speed){
        this.currentSpeed = speed
        return `The ${this.name} is moving at speed of ${this.currentSpeed}km per hour`
    },
    stop: function(){
        this.currentSpeed = 0
        return `The ${this.name} stopped`
    }
}

console.log(car.move(100));
