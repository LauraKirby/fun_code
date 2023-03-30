// displayName is returned before it was invoked
// it may seem like it doesn't have access to 'name'
// however, since javascript creates a 'closure' for each function
// the function will have access to the variables that were in scope
// when the function was declared
function returnAFunction() {
  const name = 'Mozilla';
  function displayName() {
    console.log(name);
  }
  return displayName;
}

// const myFunc = returnAFunction();

// invoke function that was returned
// print "Mozilla"
// myFunc();

// function updateMyParams(firstName, lastName) {
//   lastName = 'hi';
//   firstName = 'bye';
//   // console.log(firstName, lastName);
// }

// function whoGetsUpdated() {
//   const firstName = 'laura';
//   const lastName = 'kirby';
//   updateMyParams(firstName, lastName);
//   return `${`${firstName} ${lastName}`}`;
// }

// console.log(whoGetsUpdated());

// ---------------------------------
// Hoisting
// ---------------------------------
var numOfBeers = 5;

function getMoreBeers() {
  console.log(`I have this many beers: ${numOfBeers}`);

  var numOfBeers = 25;
  return numOfBeers;
}

console.log(`I now have this many beers: ${getMoreBeers()}`);

// I have this many beers: undefined
// I now have this many beers: 25

/*
 *  Closures
 */
const minus = (function () {
  let counter = 999;
  return function () {
    counter -= 1;
    return counter;
  };
}());

minus();
minus();
minus();

/*
 *  Dependency Injection With Closures
 */
function createFactories(logger) {
  return {
    emailFactory(greeting) {
      return function (greet) {
        logger(greeting + greet);
      };
    },
    smsFactory(text) {
      return function (text) {
        logger(text);
      };
    },
  };
}

const animals = [{ type: 'lion' }, 'tiger'];
const clones = animals;
console.log(clones);
clones[0].type = 'bear';
clones[1].type = 'sheep';
console.log(animals[0].type, clones[0].type);
console.log(animals[1].type, clones[1].type);

console.log([3] == [3]);

// Below, we see two ways of creating new objects.
// after the object is created, it is copied and then printed.
// on line 99, why is type "undefined"?
// Answer: if you don't set the attribute to 'enumerable:true', it will default 
// to 'false' and the deconstructor won't work
console.log('-------------------- copy cat --------------------');
const cat = Object.create({}, { type: { value: 'lion', enumerable: true } });
cat.size = 'large';
console.log('cat.type: ', cat.type)
const copyCat = { ...cat };

console.log(copyCat.type, copyCat.size);
// => undefined large

console.log('-------------------- cloned circle --------------------');
const circle = {
  radius: 10,
  style: {
    color: 'blue',
  },
};

const clonedCircle = { ...circle };

console.log(clonedCircle.radius, clonedCircle.style);
// => 10 {color: blue}

// console.log('-------------------- deconstruct to variables --------------------');
// const myObjj = { hi: 'bye' };
// const { hi } = myObjj;
// console.log(hi);
