// coderpad, wrap async function in a self-envoking function
void async function main() {
  // const thirdAndThirdToLast = await findThirdAndThirdToLastPokemonType()
  // console.log(thirdAndThirdToLast)
}()

const _ = require('lodash');

class Greeter {
  greeting: string;
  constructor(message: string) {
    this.greeting = message;
  }
  greet() {
    return "Hello, " + this.greeting;
  }
}

let greeter = new Greeter("world");

_.times(4, () => console.log(greeter.greet()));



// const chai = require('chai')
const sinon = require('sinon')
const sinonChai = require('sinon-chai')
const { expect } = require('chai');
// chai.should()
// chai.use(sinonChai)

function hello(name: string, cb: any) {
  cb('hello ' + name)
}

var cb = sinon.spy()
hello('world', cb)
// cb.should.have.been.calledWith('hello world')
// cb.should.have.been.calledWith('this test should fail')

expect(true).to.equal(true)
console.log('hello')
// chai.expect(foo).to.be.a('string');
// chai.expect(foo).to.equal('bar');
// chai.expect(foo).to.have.lengthOf(3);
// chai.expect(beverages).to.have.property('tea').with.lengthOf(3);
const clearbitUserData = {
  id: '',
  name: {
      givenName: 'Nikolas', 
      familyName: 'Francisco',
      fullName: 'Nikolas Francisco'
  },
  email: '',
  employment: {
      domain: '',
      name: ''
  },
}


const ransomNote = 'we have your passwords'
let noteMap: Record<any, number> = {}

for (const letter of ransomNote) {
  if (noteMap[letter]) {
    noteMap[letter]++
  } else {
    noteMap[letter] = 1
  }
}

// plain javascript async function with await
function resolveAfter2Seconds() {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('resolved');
    }, 2000);
  });
}

async function asyncCall() {
  console.log('calling');
  const result = await resolveAfter2Seconds();
  console.log(result);
  // Expected output: "resolved"
}

asyncCall();



import { describe, expect, it, vi, beforeEach } from 'vitest'
import  { enrichAttendee } from './index'
import vendors from './
vi.mock('./vendors')


describe("vendors are mocked", () => {
  it('vendors.clearbit is mocked', async () => {
      expect(vi.isMockFunction(vendors.clearbit)).toBe(true)
  })
    
  it('vendors.fullcontact is mocked', async () => {
      expect(vi.isMockFunction(vendors.fullcontact)).toBe(true)
  })
})

describe('#enrichAttendee', () => {
    describe("vendors are mocked", () => {
      it('vendors.clearbit is mocked', async () => {
          expect(vi.isMockFunction(vendors.clearbit)).toBe(true)
      })
        
      it('vendors.fullcontact is mocked', async () => {
          expect(vi.isMockFunction(vendors.fullcontact)).toBe(true)
      })
    })
      

})



import { vi } from 'vitest'

export default {
  get: vi.fn(),
}
