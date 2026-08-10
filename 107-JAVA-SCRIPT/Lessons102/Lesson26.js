function sum(firstNumber, secondNumber){
    return firstNumber + secondNumber
}

function sub(firstNumber, secondNumber){
    return firstNumber - secondNumber
}

function operation(firstNumber, secondNumber, opCallback){
    return `[:[${opCallback(firstNumber, secondNumber)}]:]`
}

console.log(operation(5, 2, sub))