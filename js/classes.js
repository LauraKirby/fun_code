class Cat {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(this, ` makes a noise.`);
  }
}

class Lion extends Cat {
  speak() {
    super.speak();
    console.log(this, ` roars.`);
  }
}

const l = new Lion('Fuzzy');
l.speak();
// Fuzzy makes a noise.
// Fuzzy roars.


// When a static or instance method is called without a value for this, such as
// by assigning the method to a variable and then calling it, the this value 
// will be undefined inside the method. 

// code within the class body is always executed in strict mode
// even if the "use strict" directive isn't present
class Animal {
  speak() {
    return this;
  }
  static eat() {
    return this;
  }
}


const obj = new Animal();
obj.speak(); // the Animal object
// below, when you store the function and then envoke it, 
// you no longer have access to the class's 'this'
const speak = obj.speak;
console.log(speak()); // undefined

Animal.eat(); // class Animal
const eat = Animal.eat;
console.log(eat()); // undefined


// If we rewrite the above using traditional function-based syntax in non–strict mode, 
// then this method calls are automatically bound to globalThis. 
// In strict mode, the value of this remains as undefined.

function Animal2() { }

Animal2.prototype.speak = function () {
  return this;
};

Animal2.eat = function () {
  return this;
};

const obj2 = new Animal();
const speak2 = obj.speak;
console.log(speak2()); // global object (in non–strict mode)

const eat2 = Animal.eat;
console.log(eat2()); // global object (in non-strict mode)
