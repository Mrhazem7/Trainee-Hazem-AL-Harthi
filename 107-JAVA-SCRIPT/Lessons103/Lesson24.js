let student = {
    name : {
        firstName : 'Ali',
        lastName : 'Nasser'
    },
    age : 25
}

let {name:{lastName: yourLastName}} = student
console.log(yourLastName)
