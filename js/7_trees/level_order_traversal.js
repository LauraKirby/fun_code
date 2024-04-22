var levelOrder = function (root) {
  const result = [];
  const queue = [root];

  while (queue.length) {
    const queueLength = queue.length;
    const currentLevel = [];
    console.log("queueLength: ", queueLength);

    for (let i = 0; i < queueLength; i++) {
      const currentNode = queue.shift();

      console.log("current node: ", currentNode);
      if (currentNode) {
        currentLevel.push(currentNode.val);
        // add children to queue
        queue.push(currentNode.left);
        queue.push(currentNode.right);
      }
    }
    if (currentLevel.length) {
      result.push(currentLevel);
    }
  }
  return result;
};
