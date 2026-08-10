const numbers = [2, 4, 1, 3, 5]

const total = numbers.reduce(function(accumulator, currentValue, index, array) {
    return accumulator + currentValue
}, 100)
console.log(total);
