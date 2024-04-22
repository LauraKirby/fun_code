// not the best implementation of fizzbuzz but it shows how case statements work
function fizzBuzz(n: number): string[] {
  const output: Array<any> = []
  let counter = 1

  while (counter <= n) {
    const selectedPhrase = selectPhrase(n, counter)

    output.push(selectedPhrase)
    console.log('output: ', output)
    counter++
  }

  return output
}

function selectPhrase(n, counter): string {
  const divisableBy = canBeDividedBy(counter)

  switch (divisableBy) {
    case ('3'): {
      return 'Fizz'
    }
    case ('5'): {
      return 'Buzz'
    }
    case ('35'): {
      return 'FizzBuzz'
    }
    default: {
      return counter.toString()
    }
  }
}

function canBeDividedBy(num): string {
  const dividers: Array<string> = []

  if (num % 3 === 0) {
    dividers.push('3')
  }

  if (num % 5 === 0) {
    dividers.push('5')
  }

  return dividers.sort().join('')
}


// another solution that is faster and takes up less memory 
function fizzBuzz2(n: number): string[] {
  const output: Array<any> = []
  let counter = 1

  while (counter <= n) {
    let selectedPhrase = ''

    if (counter % 3 === 0) {
      selectedPhrase += 'Fizz'
    }

    if (counter % 5 === 0) {
      selectedPhrase += 'Buzz'
    }

    if (!selectedPhrase) {
      selectedPhrase += counter
    }

    output.push(selectedPhrase)
    counter++
  }

  return output
}
