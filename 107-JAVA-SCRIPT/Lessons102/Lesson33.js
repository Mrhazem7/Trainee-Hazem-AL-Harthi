const ages = [11, 13, 15, 12]

const hasAdult = ages.some(function(element) {
    return element >= 18
})
console.log(hasAdult);
