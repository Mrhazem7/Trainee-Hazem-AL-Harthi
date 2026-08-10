let user1 = {
    firstName: "Fatimah",
    lastName: "Khalid",
}
let user2 = {
    firstName: "Asmaa",
    lastName: "Mohammed"
}

let printFullName = function(age){
    console.log("Hello, "+this.firstName+" "+this.lastName+". Your age is:"+age);
    return
}

let newFunction = printFullName.bind(user1)
newFunction("25")
