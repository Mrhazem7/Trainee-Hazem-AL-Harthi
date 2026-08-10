const numbers = [11, 7, 9, 15]

const el = numbers.find(function(element) {
    return element % 4 === 0
})
console.log(el);
