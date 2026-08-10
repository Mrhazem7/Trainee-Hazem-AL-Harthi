let student = {
    name : 'Salem',
    age : 18,
    gender: false
}

let {name, ...others} = student
console.log(name, others)
