class Greeter {
  greeting: string;
  constructor(message: string) {
    this.greeting = message;
  }
  
  greet = (): string => {
    return "Hello, " + this.greeting;
  }
}

const greeter = new Greeter("world");

greeter.greet();


// Inheritance 
class Animal {
  move = (distanceInMeters: number = 0): void => {
    console.log(`Animal moved ${distanceInMeters}m.`);
  }
}
 
class Dog extends Animal {
  bark = (): void => {
    console.log("Woof! Woof!");
  }
}
 
const dog = new Dog();
dog.bark();
dog.move(10);
dog.bark();
