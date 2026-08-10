const newUser = new Promise((resolve, reject) => {
setTimeout(() => {
    const userInfo = {
        name: 'Khalid',
        age: 19
    }
    resolve(userInfo)
}, 3000)
})

const addNewUser = userInfo => {
    let userAge = userInfo.age
    let adultAge;
    if ( userAge >= 18) {
        adultAge = `${userInfo.name} is an Adult`
    } else {
        adultAge = `${userInfo.name} is NOT an Adult`
    }
    return Promise.resolve(adultAge)
}
newUser
    .then(addNewUser)
    .then(res => {
    console.log('** User info received **')
    console.log(res)
})