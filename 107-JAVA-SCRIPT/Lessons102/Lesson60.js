let user1 = {
    firstName: "Fatimah",
    lastName: "Khalid"
}

let printFullName = function(){
    console.log("Hello, "+this.firstName+" "+this.lastName);
  }
printFullName();