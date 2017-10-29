var greetingPromise = sayHello();
greetingPromise.then(function (greeting) {
    console.log(greeting);    // 'hello world’
});

var greetingPromise = sayHello();

greetingPromise.then(function (greeting) {
        console.log(greeting);    // 'hello world’
    },
    function (error) {
        console.error('uh oh: ', error);   // 'uh oh: something bad happened’
    });

// Transforming Future Values
var greetingPromise = sayHello();

greetingPromise.then(function (greeting) {
    return greeting + '!!!!';
}).then(function (greeting) {
    console.log(greeting);    // 'hello world!!!!’
});


// Sequencing Asynchronous Operations

// A function passed to then can also return another promise.
// This allows asynchronous operations to be chained together,
// so that they are guaranteed to happen in the correct order.
// For example, if addExclamation is asynchronous (possibly needing
// to access another web service) and returns a promise for the
// new greeting:

var greetingPromise = sayHello();
greetingPromise.then(function (greeting) {
    return addExclamation(greeting); // addExclamation returns a promise
}).then(function (greeting) {
    console.log(greeting);    // 'hello world!!!!’
})

// This can be written more simply as:

var greetingPromise = sayHello();
greetingPromise
    .then(addExclamation)
    .then(function (greeting) {
        console.log(greeting);    // 'hello world!!!!’
    });


// Handling Errors
var greetingPromise = sayHello();
greetingPromise
    .then(addExclamation)
    .then(function (greeting) {
        console.log(greeting);    // 'hello world!!!!’
    }, function(error) {
        console.error('uh oh: ', error);   // 'uh oh: something bad happened’
    });