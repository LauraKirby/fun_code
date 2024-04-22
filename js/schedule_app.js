const _ = require('lodash');

const scheduleAppointment = function(existingAppointments, newAppointmentLength){
    if(existingAppointments.length === 0) return new Date(2024,0,1,0,0)
    if(existingAppointments.length === 1) return existingAppointments[0][1]
    
    existingAppointments.sort(function(x, y){return x[1].timestamp - y[1].timestamp})
    
    const validTimeSlots = []
    
    for(var i = 0; i < existingAppointments.length - 1; i++){
        const endTime = existingAppointments[i][1]
        const nextStartTime = existingAppointments[i+1][0]
        const gapBetweenApps = convertToMinutes(nextStartTime - endTime)
        
        if(gapBetweenApps >= newAppointmentLength){
            validTimeSlots.push([endTime, gapBetweenApps])
        } 
    }
    
    validTimeSlots.sort(function(x, y){return x[1] - y[1]})
    
    return validTimeSlots[0][0]
}

const convertToMinutes = function(milliseconds){
    return Math.floor(milliseconds / 60000)
}

// list of the therapist’s existing appointments
// length of the appointment we want to add

/*
"2024-01-01 12:00", "2024-01-01 12:30"
"2024-01-01 13:00", "2024-01-01 14:00"
"2024-01-01 15:00", "2024-01-01 15:30"
"2024-01-01 16:15", "2024-01-01 17:00"
*/

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/Date
// const date2 = new Date('1995-12-17T03:24:00');
// var d = new Date("2020-04-13T00:00:00.000+08:00");

// new Date(year, monthIndex, day, hours, minutes)
const existing = [
    [new Date(2024,0,1,12,0), new Date(2024,0,1,12,30)],
    [new Date(2024,0,1,13,0), new Date(2024,0,1,14,0)],
    [new Date(2024,0,1,15,0), new Date(2024,0,1,15,30)],
    [new Date(2024,0,1,16,15), new Date(2024,0,1,17,0)]
]

// assume length in minutes
const lengthOfNewApp = 45
const result1 = scheduleAppointment(existing, lengthOfNewApp)
console.log("\n\nexpected: 15:30 start time")
console.log("actual (result1): ", result1)

// exactly 1 previously scheduled appointment
// Notes: this would is a bigger product decision. 
// Optionally, instead of scheduling after the one scheduled appointment, 
// We could schedule before and if there isn't sufficient time, then schedule after.
const existing2 = [
    [new Date(2024,0,1,12,0), new Date(2024,0,1,12,30)]
]
const result2 = scheduleAppointment(existing2, lengthOfNewApp)
console.log("\n\nexpected 12:30 start time")
console.log("actual (result2): ", result2)

// no previously scheduled appointments
const existing3 = []
const result3 = scheduleAppointment(existing3, lengthOfNewApp)
console.log("\n\nexpected 00:00 start time")
console.log("actual (result3): ", result3)

// Notes regarding debugging JavaScript date creation. 
// The following works. The issue we saw during the challenge was 
// related to using a loop and timing. 
const existing4 = [
    [new Date("2024-01-01T12:00"), new Date("2024-01-01 12:30")],
    [new Date("2024-01-01 13:00"), new Date("2024-01-01 14:00")],
    [new Date("2024-01-01 15:00"), new Date("2024-01-01 15:30")],
    [new Date("2024-01-01 16:15"), new Date("2024-01-01 17:00")]
]
const result4 = scheduleAppointment(existing4, lengthOfNewApp)
console.log("\n\nexpected 15:30 start time")
console.log("actual (result4): ", result4)
