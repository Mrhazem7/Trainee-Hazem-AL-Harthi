let student = {
    name : 'Salem',
    age : 18
}

let {name, nickname = 'unknown'} = student
console.log(name, nickname)
