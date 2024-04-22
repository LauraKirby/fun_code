/**
 * @param {number[]} piles
 * @param {number} h
 * @return {number}
 */

// find the rate of bananas that koko eats per hour to finish all bananas
// koko can visit one pile per hour. 
// koko can spend more than one hour on a single pile of bananas. 
var minEatingSpeed = function(piles, h) {
    let left = 1
    let right = Math.max(...piles)
    let finalRatePerHour = right
    

    while(left <= right) {
        console.log('\n\n\nstart')
        let midRate = Math.floor((left + right) / 2)
        console.log('left: ', left)
        console.log('right: ', right)
        console.log('h (initial time): ', h)
        console.log('finalRatePerHour: ', finalRatePerHour)
        console.log('midRate: ', midRate)
        
        
        const hoursForGivenRate = calculateHoursForRate(piles, midRate)
        console.log('hoursForGivenRate: ', hoursForGivenRate)

        if(hoursForGivenRate <= h){
            console.log('hoursForGivenRate <= finalRatePerHour update right: ', midRate - 1)
            finalRatePerHour = Math.min(finalRatePerHour, midRate)
            // continue looking left, 
            // update right to be smaller
            right = midRate - 1 

        // it took too long to eat at this rate
        // eat at a faster rate
        } else {
        console.log('hoursForGivenRate >= finalRatePerHour, update left: ', midRate + 1)
        // update left to be bigger
            left = midRate + 1
        }
    }
    
    return finalRatePerHour
};

const calculateHoursForRate = function(piles, rate){
    let timePassed = 0
    for(let i = 0; i < piles.length; i++){
        console.log('Math.ceil(piles[i] / rate): ', Math.ceil(piles[i] / rate))
        timePassed += Math.ceil(piles[i] / rate)
    }
    return timePassed
}

// 111 1111 1111
// 3 piles of bananas

// 2nd pile has 4 bananas

// guard comes back in 8 hours

// k = 1 


// Input: piles = [3,6,7,11], h = 8
// Output: 4


// calculate the rate of bananas that koko eats per hour to finish all bananas
// use binary search to find the correct rate
// create a list with minium and maximum number of bananas per hour
// maximum found by finding the highest value in the 'piles' array
// here the maximum is 11
// minimum is 1

// range
// [1,2,3,4,5,6,7,8,9,10, 11], 

// calculate the midpoint, which will be the rate
// (left + right) / 2
// (1 + 11) / 2 = 6

// midpointRate = 6

// calculate time to complete each pile with given rate: 
// timeForPile = piles[0] / midpointRate
// timeForPile = 3 / 6
// timeForPile = Math.ceil(.16)
// timeForPile = 1 hour
// totalTime = 1 hour

// timeForPile = piles[1] / midpointRate
// timeForPile = 6 / 6
// timeForPile = Math.ceil(1)
// timeForPile = 1 hour
// totalTime = 2 hours

// timeForPile = piles[2] / midpointRate
// timeForPile = 7 / 6
// timeForPile = Math.ceil(1.16)
// timeForPile = 2 hours
// totalTime = 4 hours

// timeForPile = piles[3] / midpointRate
// timeForPile = 11 / 6
// timeForPile = Math.ceil(1.83)
// timeForPile = 2 hours
// totalTime = 6 hours

// 6 hours is less than h (h = 8). 
// 6 is a viable solution but is it the lowest?

// calculate new midpoint to the left
// update right to a lower value, the midpointRate - 1
// midpointRate: (1 + 5) / 2 = 3
// [3,6,7,11]
// 3/3 = 1
// 6/3 = 2
// 7/3 = 3
// 11/3 = 4
// total time = 10
// with a rate of 3 bananas per hour, 
// it would take koko 10 hours to complete all the bananas


// calculate new midpoint to the right
// update left to store the previous midpointRate + 1
// midpointRate: (4 + 5) / 2 = 3
