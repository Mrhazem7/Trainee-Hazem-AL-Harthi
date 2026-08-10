function square(number) {
    if(isNaN(number))
        return 'Invalid input'
    return number * number
}

console.log(square('a'))
