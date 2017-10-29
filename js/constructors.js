
// write function that will be called as a constructor
function Tree(name) {
  this.name = name;
}

// keep the constructor clean:

// write defaults:
Tree.prototype.environment = "outside";

// write methods:
Tree.prototype.printEnvironment = function(){
  console.log(this.environment);
};

// create an instance of Tree
var oak = new Tree("oak");
oak.printEnvironment();
console.log("oak's constructor is " + theTree.constructor);
