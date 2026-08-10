const ages = [21, 23, 27, 25, 22, 17]

const areAdults = ages.every(function(element) {
    return element >= 18
})
console.log(areAdults);
