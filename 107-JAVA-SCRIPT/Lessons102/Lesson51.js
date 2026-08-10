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
    // key: value
    name: 'camry',
    color: 'white',
    currentSpeed: 0,
    move: function(speed){},
    stop: function(){
        console.log('stop method');
    }
}

// objectName.key
console.log(car.name);
