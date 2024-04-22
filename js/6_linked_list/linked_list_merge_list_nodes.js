// var ListNode = function(val, next) {
//   this.val = val == undefined ? 0 : val;
//   this.next = next == undefined ? null : next;
// }

function ListNode(val, next) {
  this.val = (val === undefined ? 0 : val)
  this.next = (next === undefined ? null : next)
}

/**
* Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. 
* @param {number} val
* @return {void}
*/
ListNode.prototype.addAtHead = function(val) {
  let node = new ListNode(val);
  node.next = this.head;
  this.head = node;
};

/**
* Append a node of value val to the last element of the linked list. 
* @param {number} val
* @return {void}
*/
ListNode.prototype.addAtTail = function(cur, val) {
  if (this == null) {
      this == new ListNode(val);
      return;
  }
  let node = new ListNode(val);
  while (cur.next !== null) {
      cur = cur.next;
  }
  cur.next = node;
};


ListNode.prototype.print = function(){
  let values = [];
  let cur = this;
  while (cur !== null) {
      values.push(cur.val);
      cur = cur.next;
  }

  console.log(values);
}
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} list1
 * @param {ListNode} list2
 * @return {ListNode}
 */

var mergeTwoLists = function(list1, list2){
  // create a starting point and 
  // keep a reference to it
  // val: falsey value
  // next: falsey value
  const startOfList = new ListNode()
  // tail.next will be updated as we move through the lists and compare values
  // therefore, startOfList.next will contain the first node, with the lowest value, 
  // and the node that we will want to return
  let tail = startOfList
  
  
  while(list1 && list2) {
    if(list1.val < list2.val){
      tail.next = list1
      // move head node forward by one
      list1 = list1?.next
    } else {
      tail.next = list2
      // move head node forward by one
      list2 = list2?.next
    }
    tail = tail.next
  }
  // if one list is longer than the other, then it will still contain values
  // update the 'next' pointer to the remaining list items in the 
  // longer list. Do not need to update the remaining pointers here because they 
  // are already valid. 
  if(list1){
    tail.next = list1
  }
  if(list2){
    tail.next = list2
  }

  // remove empty node at the beginning of the list
  return startOfList.next
}


const headNode = new ListNode()
headNode.addAtTail(headNode, 1)
headNode.addAtTail(headNode, 2)
headNode.addAtTail(headNode, 3)
headNode.addAtTail(headNode, 4)

const headNode2 = new ListNode()
headNode2.addAtTail(headNode2, 1)
headNode2.addAtTail(headNode2, 2)
headNode2.addAtTail(headNode2, 3)
headNode2.addAtTail(headNode2, 4)
headNode2.addAtTail(headNode2, 5)
headNode2.addAtTail(headNode2, 6)
headNode2.addAtTail(headNode2, 7)
headNode2.addAtTail(headNode2, 8)

console.log('\n\nheadNode:')
console.log(headNode)
headNode.print()

console.log('\n\nheadNode2:')
console.log(headNode2)
headNode2.print()

const mergedLists = mergeTwoLists(headNode, headNode2)
console.log('\n\nmergedLists:')
console.log(mergedLists)
mergedLists.print()
