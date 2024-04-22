// Definition for singly-linked list.
class ListNode {
  val: number
  next: ListNode | null
  constructor(val?: number, next?: ListNode | null) {
    this.val = (val === undefined ? 0 : val)
    this.next = (next === undefined ? null : next)
  }
}

// solution explained:
// https://leetcode.com/explore/featured/card/the-leetcode-beginners-guide/692/challenge-problems/4426/
function middleNode(head: ListNode | null): ListNode | null {
  let middleNode = head
  let endNode = head

  // in the while loop: 
  // - the 'middle location' can be tracked as follows:
  // - jump two ahead
  // - increment the middle node by 1

  while (endNode && endNode.next && middleNode) {
    middleNode = middleNode?.next

    endNode = endNode.next?.next
  }


  return middleNode
};
