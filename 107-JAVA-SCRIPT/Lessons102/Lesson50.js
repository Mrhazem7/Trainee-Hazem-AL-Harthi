let name = 'camry'
let color = 'white'
let currentSpeed = 0
function move(speed) {
  carCurrentSpeed = speed
  return `The ${name} is moving at speed of ${carCurrentSpeed}km per hour`
}
function stop() {
  carCurrentSpeed = 0
  return `The ${name} stopped`
}

console.log(move(100))
