console.log('Start')

const newUser = new Promise((resolve, reject) =>{
setTimeout(() => {
    const userInfo = {
        name: 'Khalid',
        age: 19
    }
    resolve(userInfo)
}, 3000)
})
newUser
    .then(res => {
    console.log('** User info received **')
    console.log(res)
})

console.log('End')
