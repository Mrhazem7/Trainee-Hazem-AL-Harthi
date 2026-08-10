const newUser = new Promise((resolve, reject) => {
    setTimeout(() => {
        const userInfo = {
            name: 'Khalid',
            age: 11
        }
        resolve(userInfo)
    }, 3000)
})
const addNewUser = userInfo => {
    let userAge = userInfo.age
    let adultAge;
    if ( userAge >= 18) {
        adultAge = `${userInfo.name} is an Adult`
        return Promise.resolve(adultAge)
    } else {
        adultAge = `${userInfo.name} is NOT an Adult`
        return Promise.reject(new Error(adultAge))
    }
}
newUser
    .then(addNewUser)
    .then(res => {
    console.log('** User info received **')
    console.log(res)
    })
    .catch(err => {
        console.log(err.message)
    })