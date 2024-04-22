/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var topKFrequent = function(nums, k) {
    // iterate through nums
    // map unique number in nums to the number of times that it appears
    // each time a count is updated, it needs to be removed from the bucket and added to a new bucket
    const numCount = {}
    const buckets = Array.from({length: nums.length - 1}, () => [])

    for(let i = 0; i < nums.length; i++){
        const currentNum = nums[i]
        if(numCount[currentNum]){
         // remove from current bucket
         deleteAtIndex(currentNum, numCount[currentNum], buckets)
         numCount[currentNum] ++   
        } else {
         numCount[currentNum] = 1   
        }
        // will this modify the original array? 
        console.log('insert at index')
        insertAtIndex(currentNum, numCount[currentNum], buckets)
    }
    console.log('buckets loop: ', buckets)
    console.log('numCount loop: ', numCount)
    const result = []
    for(let j = 0; j < k; j++){
        const highestOccurringValue = buckets.pop()
        if(highestOccurringValue.length < 1){
            buckets.pop()
            j--
        } else {
            result.push(...highestOccurringValue)
        }
    }
    console.log('buckets: ', buckets)
    console.log('result: ', result)
    return result
};

var insertAtIndex = function(num, count, buckets){
    buckets[count - 1].push(num)
    return buckets
}

var deleteAtIndex = function(num, count, buckets){
    const bucket = buckets[count - 1]
    console.log('\n\n\nbuckets: ', buckets)
    console.log('bucket: ', bucket)
    const indexOfNum = bucket.indexOf(num)
    console.log('before splice: ', buckets)
    buckets[count - 1].splice([indexOfNum])
    console.log('after splice: ', buckets)
    return buckets
}

// Input: nums = [1,1,1,2,2,3], k = 2
// Output: [1,2]

const nums = [1,1,1,2,2,3]
const k = 2
const res = topKFrequent(nums, k)
console.log('expected: [1,2], actual: ', res)
