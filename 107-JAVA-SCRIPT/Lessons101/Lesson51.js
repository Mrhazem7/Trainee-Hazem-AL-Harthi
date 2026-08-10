function printNumbers(to){
    for(let i = 1; i <= to; i++){
        console.log(i);
    }
}

function add(firstNumber, secondNumber){
    return firstNumber + secondNumber;
}

printNumbers(add(2, 7));
