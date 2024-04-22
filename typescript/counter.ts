function createCounter(n: number): () => number {
  return function () {
    // given '++' follows 'n', 
    // 'n' will be returned before '++' is called; 
    // however, '++' will then be called and after n is returned, 
    // 'n' is incremented to 11 
    return n++
  }
}

const createC = (n: number) => {
  return n++
}

function createCo(n: number): () => number {
  return function () {
    return mySum(n)
  }
}

function mySum(n: number): number {
  return n++
}

// const myCounter = () => createCo(10)
const myCounter = createCounter(10)
// each time 'myCounter()' is called, it still contains a reference to the same 
// variable that it was first initialized with. 
console.log(myCounter())
// on line 15, 'myCounter()' contains a function that looks/behaves like:
// function () {
// return 10
// increment to 11
//}()
console.log(myCounter())

//function () {
  // return 12
  // increment to 13
//}()
