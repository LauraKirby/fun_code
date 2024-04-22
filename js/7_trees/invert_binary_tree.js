/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @return {TreeNode}
 */
var invertTree = function(root) {
  if(!root){
    return root
}

const tempLeft = root.left
root.left = root.right
root.right = tempLeft

invertTree(root.left)
invertTree(root.right)

return root
};

const input1 = [4,2,7,1,3,6,9]

function TreeNode(val, left, right) {
  this.val = (val===undefined ? 0 : val)
  this.left = (left===undefined ? null : left)
  this.right = (right===undefined ? null : right)
}

// TreeNode.prototype.print = () => {
//   // traverse and print
// }

const binaryTree = new TreeNode(4)
const left = binaryTree.left = new TreeNode(2)
const right = binaryTree.right = new TreeNode(7)

left.left = new TreeNode(1)
left.right = new TreeNode(3)

right.left = new TreeNode(6)
right.right = new TreeNode(9)

const sol1 = invertTree(binaryTree)
// original: [4,2,7,1,3,6,9]
console.log('expected: [4,7,2,9,6,3,1] actual: ', sol1)
