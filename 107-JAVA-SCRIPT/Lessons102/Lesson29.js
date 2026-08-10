function operation(firstNumber, secondNumber, opCallback){
    return `result = [${opCallback(firstNumber, secondNumber)}]`
}

console.log(operation(5, 2, (firstNumber, secondNumber) => firstNumber + secondNumber))