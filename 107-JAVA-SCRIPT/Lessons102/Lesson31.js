function format(message, formatCallback){
    return formatCallback(message)
}

function htmlFormat(message){
    return `<div>${message}</div>`
}

function jsonFormat(message){
    return `{"message": "${message}"}`
}

console.log(format('Welcome to JavaScript', jsonFormat))
