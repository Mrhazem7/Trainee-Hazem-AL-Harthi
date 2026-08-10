function sum(first, second, ...others){
    console.log(...others)
    return first + second
}

console.log(sum(1, 2, 6, 80, 75))
