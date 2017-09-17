// lowdash & _ - are functional libraries
// closure
class Person {
  constructor(age, name) {
    this.age = age;
    this.name = name;
    this.callback = callback.bind(this);
  }

  set(property, value){
    this[property] = value;
    this.callback();
  }

  get(property){
    return this[property];
  }
}

var p1 = new Person(100, "Laura");

p1.set("hairColor", "brown");

function callback(){
  console.log(this.hairColor);
}


// Javascript implementation

function Person2(age, name){
  this.age = age;
  this.name = name;
  this.myCallback = callback.bind(this);
  this.set = function(property, value){
    this[property] = value;
  };
  this.printProperty = printNewProperty2.bind(this, "age");


}

function printNewProperty2(property){
  console.log(this[property]);
}

var p2 = new Person2(100, "Michelle")
p2.printProperty()
