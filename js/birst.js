// lowdash & _ - are fuctional libraries
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



// visualizer
// dashboard - finance team
// admin/ pronto - items to connect database when using birst as product
// aquired by infor, 3-4 months ago

// senior software engineer
// 2 weeks ago, flown to NY to meet with headquarters
// has been there for 10 months
// about 50 people on the floor, 1/2 engineering is in India, QA is there.