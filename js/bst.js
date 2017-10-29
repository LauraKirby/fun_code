function User(firstName, lastName){
  this.firstName = firstName;
  this.lastName = lastName;
}

me = new User("Laura", "Kirby");

function BST(value){
  this.value = value;
  this.left = null;
  this.right = null;
}

BST.prototype.insert = function(value){
  if (value <= this.value) {
    if (!this.left) this.left = new BST(value);
    else this.left.insert(value);
  } else {
    if (value > this.right) this.right = new BST(value);
    else this.right.insert(value);
  }
};

// iterate over the smallest to the largest value
BST.prototype.depthFristTraversal = function() {
  if(this.left) this.left.depthFristTraversal();
  if(this.right) this.right.depthFristTraversal();
};

// iterate over and print the smallest to the largest
BST.prototype.depthFristTraversal = function(printNode){
  if(this.left) this.left.depthFristTraversal(printNode);
  printNode(this.value);
  if(this.right) this.right.depthFristTraversal(printNode);
};

function printNode(value){
  console.log(value);
}

BST.prototype.depthFristTraversalPreOrder = function(printNode){
  printNode(this.value);
  if(this.left) this.left.depthFristTraversal(printNode);
  if(this.right) this.right.depthFristTraversal(printNode);
};

bst = new BST(50);
bst.insert(30);
bst.insert(70);
bst.insert(100);
bst.insert(60);
bst.insert(59);
bst.insert(20);
bst.insert(45);
bst.insert(35);
bst.insert(85);
bst.insert(105);
bst.insert(10);
console.log(bst);
bst.depthFristTraversal(printNode);
console.log("pre order \n")
bst.depthFristTraversalPreOrder(printNode);

laura = {
  getAge: function(){
    console.log("30");
  }
};


suneel = {
  name: "suneel"
}

suneel.getAge = laura.getAge;

suneel.getAge();
console.log(suneel)