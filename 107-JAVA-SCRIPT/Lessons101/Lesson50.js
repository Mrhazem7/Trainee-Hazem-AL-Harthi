function printNumbers(to){
    for(let i = 1; i <= to; i++){
        console.log(i);
    }
}

function add(firstNumber, secondNumber){
    let result = firstNumber + secondNumber;
    return result;
}

let value = add(2, 7) - add(2, 3);
console.log(value);
