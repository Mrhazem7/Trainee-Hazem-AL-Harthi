function sub(firstNumber, secondNumber){
    return firstNumber - secondNumber
}

function operation(firstNumber, secondNumber, opCallback){
    return `result = [${opCallback(firstNumber, secondNumber)}]`
}

console.log(operation(5, 2, function (firstNumber, secondNumber){
    return firstNumber + secondNumber
}))

console.log(operation(5, 2, sub))