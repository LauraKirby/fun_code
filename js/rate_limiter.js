// 359. Logger Rate Limiter
// Design a logger system that receive stream of messages along with its timestamps,
// each message should be printed if and only if it is not printed in the last 10 seconds.

// Given a message and a timestamp (in seconds granularity),
// return true if the message should be printed in the given timestamp,
// otherwise returns false.
// It is possible that several messages arrive roughly at the same time.

class Logger {
  recentMessages = {};
  printInterval = 3;

  constructor(printInterval) {
    this.printInterval = printInterval
  }

  shouldPrintMessage(currentTimestamp, message) {
    this.printMessage(currentTimestamp, message)
    const previousTimestamp = this.recentMessages[message]
    let shouldPrint = true

    if (previousTimestamp) {
      shouldPrint = this.outsideOfRange(previousTimestamp, currentTimestamp)
      if (!shouldPrint) { return shouldPrint }
    }
    // this.printMessage(currentTimestamp, message)
    this.updateRecentMessages(message, currentTimestamp)

    return shouldPrint
  }

  // these could be private
  outsideOfRange(previousTimestamp, currentTimestamp) {
    console.log(
      `(currentTimestamp - interval) >= previousTimestamp\n` +
      `(${currentTimestamp} - ${this.printInterval}) >= ${previousTimestamp}`
    )

    return (currentTimestamp - this.printInterval) >= previousTimestamp
  }

  printMessage(timestamp, message) {
    console.log(`logging string "${message}" at timestamp ${timestamp}`)
  }

  updateRecentMessages(message, timestamp) {
    this.recentMessages[message] = timestamp
  }
}

// Example:
const logger = new Logger(10);

// ----------------------------------------------
// describe: a message should not be printed
// ----------------------------------------------
// --- when: unique message and unique timestamp
// ------- logging string "foo" at timestamp 1
const result1 = logger.shouldPrintMessage(1, 'foo');
console.log('Test 1');
console.log('expected result: true');
console.log('actual result: ', result1, '\n\n')

// --- when: unique message and unique timestamp
// ------- logging string "bar" at timestamp 2
console.log('Test 2');
const result2 = logger.shouldPrintMessage(2, 'bar');
console.log('expected result: true');
console.log('actual result: ', result2, '\n\n')

console.log('Test 3');
// --- when: duplicative message and outside of the "no print" range
// ------- logging string "foo" at timestamp 11
const result6 = logger.shouldPrintMessage(11, 'foo');
console.log('expected result: true');
console.log('actual result: ', result6, '\n\n')

console.log('Test 4');
// --- when: duplicative message and inside of the "no print" range for second
//           message that was printed
// ------- logging string "foo" at timestamp 11
const result7 = logger.shouldPrintMessage(12, 'foo');
console.log('expected result: false');
console.log('actual result: ', result7, '\n\n')

// ----------------------------------------------
// describe: a message should not be printed
// ----------------------------------------------
// --- when: duplicative message and within "no print" range
// ------- logging string "foo" at timestamp 3
console.log('Test 5');
const result3 = logger.shouldPrintMessage(3, 'foo');
console.log('expected result: false');
console.log('actual result: ', result3, '\n\n')

// --- when: duplicative message and at the middle of the "no print" range
// ------- logging string "bar" at timestamp 8
console.log('Test 6');
const result4 = logger.shouldPrintMessage(8, 'bar');
console.log('expected result: false');
console.log('actual result: ', result4, '\n\n')

console.log('Test 7');
// --- when: duplicative message and at the top of the "no print" range
// ------- logging string "foo" at timestamp 10
const result5 = logger.shouldPrintMessage(10, 'foo');
console.log('expected result: false');
console.log('actual result: ', result5, '\n\n')


// ----------------------------------------------
// ----------------------------------------------
// ----------------------------------------------
// testing classes
// console.log('\n\n\n')
// console.log('Logger.#privateAttr: ', Logger.#privateAttr)
// console.log('logger.#privateAttr: ', logger.#privateAttr)
