const numbers = [1, 2, 3, 0, 4, 5];

for(let i = 0; i < numbers.length; i++){
    if(numbers[i] == 0){
        break;
    }
    console.log(numbers[i]);
}

console.log('***');
