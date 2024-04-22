const calculateSum = function (numbers) {
  if (numbers.length === 0) {
    return 0
  }

  return numbers[0] + calculateSum(numbers.slice(1))
}

const input = [1, 2, 3]
const result1 = calculateSum(input)
console.log('Test 1')
console.log('expected result: 6')
console.log('actual result: ', result1, '\n\n')
                                             