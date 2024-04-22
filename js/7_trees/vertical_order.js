/** Complexity Analysis

Time Complexity: O(Nlog⁡N)\mathcal{O}(N \log N)O(NlogN) where NNN is the number of nodes in the tree.

In the first part of the algorithm, we do the BFS traversal, whose time complexity is O(N)\mathcal{O}(N)O(N) since we traversed each node once and only once.

In the second part, in order to return the ordered results, we then sort the obtained hash table by its keys, which could result in the O(Nlog⁡N)\mathcal{O}(N \log N)O(NlogN) time complexity in the worst case scenario where the binary tree is extremely imbalanced (for instance, each node has only left child node.)

As a result, the overall time complexity of the algorithm would be O(Nlog⁡N)\mathcal{O}(N \log N)O(NlogN).

Space Complexity: O(N)\mathcal{O}(N)O(N) where NNN is the number of nodes in the tree.

First of all, we use a hash table to group the nodes with the same column index. The hash table consists of keys and values. In any case, the values would consume O(N)\mathcal{O}(N)O(N) memory. While the space for the keys could vary, in the worst case, each node has a unique column index, i.e. there would be as many keys as the values. Hence, the total space complexity for the hash table would still be O(N)\mathcal{O}(N)O(N).

During the BFS traversal, we use a queue data structure to keep track of the next nodes to visit. At any given moment, the queue would hold no more two levels of nodes. For a binary tree, the maximum number of nodes at a level would be N+12\frac{N+1}{2} 
2
N+1
​
  which is also the number of leafs in a full binary tree. As a result, in the worst case, our queue would consume at most O(N+12⋅2)=O(N)\mathcal{O}(\frac{N+1}{2} \cdot 2) = \mathcal{O}(N)O( 
2
N+1
​
 ⋅2)=O(N) space.

Lastly, we also need some space to hold the results, which is basically a reordered hash table of size O(N)\mathcal{O}(N)O(N) as we discussed before.

To sum up, the overall space complexity of our algorithm would be O(N)\mathcal{O}(N)O(N).
**/

/**
 * @param {TreeNode} root
 * @return {number[][]}
 */
var verticalOrder = function (root) {
  const result = [];
  const queue = [[root, 0]];
  const columnTable = {};

  while (queue.length) {
    const [currentNode, column] = queue.shift();

    if (currentNode) {
      if (!columnTable[column]) {
        columnTable[column] = [];
      }
      // use column as a key
      // add value to corresponding column
      columnTable[column].push(currentNode.val);
      // add children to queue
      queue.push([currentNode.left, column - 1]);
      queue.push([currentNode.right, column + 1]);
    }
  }
  const sortedColumns = Object.keys(columnTable).sort((a, b) => a - b);
  for (const key of sortedColumns) {
    result.push(columnTable[key]);
  }
  return result;
};
