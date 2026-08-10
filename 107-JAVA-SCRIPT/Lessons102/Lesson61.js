let user1 = {
    firstName: "Fatimah",
    lastName: "Khalid"
}

let user2 = {
    firstName: "Asmaa",
    lastName: "Mohammed"
}

let printFullName = function(age){
    console.log("Hello, "+this.firstName+" "+this.lastName+". Your age is:"+age);
}

printFullName.call(user1, "25");
printFullName.call(user2, "20");