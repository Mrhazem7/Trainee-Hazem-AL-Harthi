function operation(firstNumber, secondNumber, opCallback){
    return `result = [${opCallback(firstNumber, secondNumber)}]`
}

const sum = (firstNumber, secondNumber) => firstNumber + secondNumber
console.log(operation(5, 2, sum))
console.log(operation(15, 12, sum))
