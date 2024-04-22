/** 

A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node.
If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.

Implement the MyLinkedList class:

* MyLinkedList() - Initializes the MyLinkedList object.

* int get(int index) - Get the value of the indexth node in the linked list. If the index is invalid, return -1.
 
* void addAtHead(int val) - Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.

* void addAtTail(int val) - Append a node of value val as the last element of the linked list. 

* void addAtIndex(int index, int val) - Add a node of value val before the indexth node in the linked list. If index equals the length of the linked list, the node will be appended to the end of the linked list. If index is greater than the length, the node will not be inserted.

* void deleteAtIndex(int index) - Delete the indexth node in the linked list, if the index is valid.

var MyListNode = function(val, next) {
  this.val = val 
  this.next = next
}

**/

var MyListNode = function(val, next) {
  this.val = val 
  this.next = next
}

var MyLinkedList = function() {
  // initialize 'head' with null. 
  // when the first 'MyListNode' instance is added, 
  // it will be assigned to 'head'
  this.head = null
};

/** 
* @param {number} index
* @return {number}
*/
MyLinkedList.prototype.get = function(index) {
  let currentNode = this.head
  let counter = 0 

  while(counter <= index && currentNode){
    if(counter === index){
      return currentNode.val
    }
    currentNode = currentNode.next
    counter++
  }

  return -1
};

/** 
* @param {number} val
* @return {void}
*/
MyLinkedList.prototype.addAtHead = function(val) {
  const newNode = new MyListNode(val)
  // assign the old head to the new node's 'next' property
  newNode.next = this.head
  // update 'head' to store the new node
  this.head = newNode
};

/** 
* @param {number} val
* @return {void}
*/
MyLinkedList.prototype.addAtTail = function(val) {
  // create a new node
  const newNode = new MyListNode(val)
  // if head is empty, insert at head
  let currentNode = this.head
  if(!currentNode){
    this.head = newNode
    return null
  }

  // else iterate until next is 'null'
  while(currentNode.next){
    currentNode = currentNode.next
  }

  currentNode.next = newNode
};

/** 
* @param {number} index 
* @param {number} val
* @return {void}
*/
MyLinkedList.prototype.addAtIndex = function(index, val) {
  // create a new node
  const newNode = new MyListNode(val)

  if(index == 0){
    this.addAtHead(val)
    return 
  }

  // iterate via 'next' until 'index' is reached
  // store a reference to the current item and the next node
  // update current node to point to new node
  // update new node to point to next node
  let currentNode = this.head
  let counter = 0 
  while(counter < index && currentNode){
    if(counter === index - 1){
      const tempNode = currentNode.next
      currentNode.next = newNode
      newNode.next = tempNode
    }
    currentNode = currentNode.next
    counter++
  }
};

/** 
* @param {number} index
* @return {void}
*/
MyLinkedList.prototype.deleteAtIndex = function(index) {
  const newNode = new MyListNode()

  if(index === 0){
    this.head = this.head.next
    return 
  }

  let counter = 0
  let currentNode = this.head
  while(counter < index && currentNode){
    if(counter === index - 1) {
      // nodeToDelete currentNode.next
      // reference to node after deleted node, currentNode.next.next
      currentNode.next = currentNode?.next?.next
      return 
    }
    currentNode = currentNode.next
    counter++
  }
};

/** 
* @return {void}
*/
MyLinkedList.prototype.print = function(index) {
  let currentNode = this.head
  while(currentNode?.next){
    console.log(currentNode)
    currentNode = currentNode.next
  }
  console.log(currentNode)
};

// ["MyLinkedList","addAtHead","addAtTail","addAtIndex","get","deleteAtIndex","get"]
// input: [[],[1],[3],[1,2],[1],[0],[0]]

var obj = new MyLinkedList()
obj.addAtHead(1)
obj.addAtTail(3)
obj.addAtIndex(1, 2)
// obj.print()
let get1 = obj.get(1)
// console.log('get1:\nexpected: 2', 'actual: ', get1)
obj.deleteAtIndex(0)
// obj.print()
let get2 = obj.get(0)
// console.log('get2:\nexpected: 2', 'actual: ', get2)


// expected output: 
// [null,null,null,null,2,null,2]

// actual output: 
// [null,null,null,null,2,null,undefined]
