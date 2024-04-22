// The sort() method sorts the elements of an array in place 
// and returns the reference to the same array, now sorted.

// default sorting method uses Unicode character sorting
// The numbers are converted to their string equivalent and 
// then sorted based on Unicode values.


// As a result, all the '1' numbers come before everything else, 
// so it will sort '11' before '3' and so on.


[11,2,22,1].sort((a, b) => a - b)


// explained: 
// The that -1 moves the item to the left (before comparing value), 
// 0 keeps it where it is, and 1 moves the item to the right (after comparing value)


var mergeTwoLists = function(list1, list2){
  const placeHolder = new ListNode()
  let tail = placeHolder
  let counter = 0

  while(list1 || list2 || counter < 10) {
      const tempNode1 = list1
      const tempNode2 = list2

      if(tempNode1.value < tempNode2.value){
          tail.next = tempNode1
          list1 = list1.next
      } else {
          tail.next = tempNode2
          list2 = list2.next
      }
      tail = tail.next
      counter++
  }
  
  return placeHolder
}
