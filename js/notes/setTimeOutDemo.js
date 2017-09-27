// what will the following print?
console.log('one');
setTimeout(function() {
  console.log('two');
}, 0);
console.log('three');

// one, three, two


setTimeout(function(){ alert("Hello"); }, 3000);

// horizontal
// art deco team - style
// page infrastructure - update legacy systems, currently updating share button

// ruchika - marketing solutions teams
// - allows users to create ads

// Ember
// Play framework
// Java


// SASS celbel


// some code!
var Foo = function( a ) {
  function bar() {
    return a;
  }
  this.baz = function() {   // here
    return a;
  };
};

Foo.prototype = {
  biz: function() {
    return a;
  }
};

var f = new Foo( 7 );
f.bar(); // undefined
f.baz(); // 7
f.biz(); // 7

// opportunity learn grow
// enthusiasm from others when asking questions

// what you check in, it must be review. whoever can review it
// 2 week model
// day to every other day standup
// 4 -7 team - front-end, backend, product manager
// story point
// print planning 1-3 hours
// mid-sprint check-in

// few projects in svn
// commited go goes into QA


// https://www.linkedin.com/comm/jobs2/view/107058414?recommendedFlavor=IN_NETWORK&refId=0fd6ca10-fb66-4971-9866-599df19f244e&trk=eml-jymbii-organic-job-card&midToken=AQEGkHhzP-aM9A&trkEmail=eml-jobs_jymbii_digest-null-49-null-null-n4zts~ilb7ytxk~fq

// what we're looking for:
// - extract out the querystring
// - then store the key-value pairs in _____, where _____ = object, array, whatever you think best

// hint:
// window.location.search === '?recommendedFlavor=IN_NETWORK&refId=0fd6ca10-fb66-4971-9866-599df19f244e&trk=eml-jymbii-organic-job-card&midToken=AQEGkHhzP-aM9A&trkEmail=eml-jobs_jymbii_digest-null-49-null-null-n4zts~ilb7ytxk~fq'

// to do: remove '?'
// str = str[1..str.length-1]
// str.substring(startingIndex, optionalEndingIndex)
// str.substring(1)
var str = window.location.search;
str.substring(1);
var pairs = str.split('&'); // array where each item is a key and a value
// var pairs = window.location.search.substring(1).split('&');
// [recommendedFlavor=IN_NETWORK,... ]

// break apart on the '='
result = {};
pairs.forEach(function(item){
  var foo = item.split('='); // foo = [recommendedFlavor, IN_NETWORK]
  result[foo[0]] = foo[1];
}
/*
  {
    recommendedFlavor: "IN_NETWORK"
  }
*/
// [[recommendedFlavor,IN_NETWORK],[key, value]... ]

