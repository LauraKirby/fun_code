// ---------------------------------------
// Handling Top-Level Async Functions
// ---------------------------------------
// wrap top-level async function in a self-invoking function
void (async function main() {
  const resolvedMessage = await resolveAfter2Seconds();
  console.log(resolvedMessage);
})();

async function resolveAfter2Seconds() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve("resolved");
    }, 2000);
  });
}

// ---------------------------------------
// Using Testing Libraries:
// ---------------------------------------
// const chai = require('chai')
const sinon = require("sinon");
const sinonChai = require("sinon-chai");
const { expect } = require("chai");

class Greeter {
  greeting: string;
  constructor(message: string) {
    this.greeting = message;
  }
  greet(): string {
    this.printGreeting();
    return "Hola, " + this.greeting;
  }
  printGreeting(): void {
    console.log(this.greeting);
  }
}

let greeter = new Greeter("world");
// after initialization, the value for greeting should be set
expect(greeter.greeting).to.equal("world");
// greet should return the string hello with the greeting appended to it
expect(greeter.greet()).to.equal("Hello, world");

// TO-DO: figure out how to setup spies

// chai.should()
// chai.use(sinonChai)

function hello(name: string, cb: any) {
  cb("hello " + name);
}

var cb = sinon.spy();
hello("world", cb);
// cb.should.have.been.calledWith('hello world')
// cb.should.have.been.calledWith('this test should fail')

expect(true).to.equal(true);
console.log("hello");
// chai.expect(foo).to.be.a('string');
// chai.expect(foo).to.equal('bar');
// chai.expect(foo).to.have.lengthOf(3);
// chai.expect(beverages).to.have.property('tea').with.lengthOf(3);
