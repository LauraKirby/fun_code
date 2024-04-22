// Find the intersection between 2 arrays.
// e.g. [1,3,2] [3,4,2] --> [2,3]
// [1,3,2,3] [3,4,2,3,3] --> [2,3,3]
// [1,6] [7,2] --> []
// [4,1,2,3,4] [2,1,4,4] --> [1,2,4,4]

function intersection(arrayA, arrayB) {
  if (arrayA.length <= 0 || arrayB.length <= 0){
    return []
  }

  // {
  // num: times it repeats
  // }

  const trackingA = {}
  const trackingB = {}
  for(const num of arrayA) {
    if(trackingA[num]){
      trackingA[num] += 1
    } else {
      trackingA[num] = 1
    }
  }

  for(const num of arrayB) {
    if(trackingB[num]){
      trackingB[num] += 1
    } else {
      trackingB[num] = 1
    }
  }

  const valuesInA = Object.keys(trackingA)

  let finalOutput = []
  // get intersection and number of occurances
  for(const val of valuesInA) {
    // in value exists in B, then check number of occurance, and duplicate the lower number of times
    if(trackingB[val]){
      if(trackingB[val] > trackingA[val]){
        finalOutput = pushValue(finalOutput, trackingA[val], val)
      } else {
        finalOutput = pushValue(finalOutput, trackingB[val], val)
      }
    }
  }

  return finalOutput
}

function pushValue(output, numberOfTimes, value) {
  while(numberOfTimes > 0) {
    output.push(value)
    numberOfTimes -= 1
  }
  return output
}

function isArrayEqual(arrayA, arrayB) {
  let i = 0;
  let arraysMatch = true

  if (arrayA.length !== arrayB.length){
    return false
  }

  for(const num of arrayA) {
    if(num != arrayB[i]){
      arraysMatch = false
    }
    i++
  }
  return arraysMatch
}

// Tests
function assertEqual(actual, expected) {
 if (isArrayEqual(actual, expected)) {
   console.log('Success!');
 } else {
   console.error('Oh no!', actual, '!==', expected);
 }
}

// assertEqual([1],[1])
// => print Success

// assertEqual([1],[3])
// => print Oh no

let testA = [2, 5, 3];
let testB = [2, 6, 3];
console.log(testA);
intersection(testA, testB);
console.log(testA);

assertEqual(
  intersection([1,3,2], [3,4,2]),
  [2,3]
);
assertEqual(
  intersection([1,3,2,3], [3,4,2,3,3]),
  [2,3,3]
);
assertEqual(
  intersection([1,6], [7,2]),
  []
);
assertEqual(
  intersection([9,9,9], [9]),
  [9]
);
assertEqual(
  intersection([1,2,1,2,3,4,2,3,2,3,2,4,2,3,2,1,2,3], [5,4,3,1,4,2,3,1,2,3,4,2,2,2,2,2]),
  [1,1,2,2,2,2,2,2,2,3,3,3,4,4]
);
