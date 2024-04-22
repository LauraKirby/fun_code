// Definition for Node.
class MyNode {
  val: number
  neighbors: MyNode[]
  constructor(val?: number, neighbors?: MyNode[]) {
    this.val = (val === undefined ? 0 : val)
    this.neighbors = (neighbors === undefined ? [] : neighbors)
  }
}


function cloneGraph(node: MyNode | null): MyNode | null {
  const visited = new Map<MyNode, MyNode>();
  return clone(node, visited);
};

function clone(node: MyNode | null, visited: Map<MyNode, MyNode>): MyNode | null {
  if (node === null) {
    return node;
  }

  if (visited.has(node)) {
    return visited.get(node) || null;
  }

  const copy = new MyNode(node.val);
  visited.set(node, copy);

  for (const neighbor of node.neighbors) {
    const myClone = clone(neighbor, visited)
    if (myClone) {
      copy.neighbors.push(myClone);
    }
  }

  return copy;
}


let graphAdj;
let visited;
let stack;
const initGraph = (maxVertice) => {
  visited = new Array(maxVertice);
  stack = new Stack();
  queue = new Queue();
  for (let i = 0; i < visited.length; i++) {
    visited[i] = false;
  }
  graphAdj = new Array(maxVertice);
  for (let i = 0; i < graphAdj.length; i++) {
    graphAdj[i] = new Array(maxVert);
  }
  for (let i = 0; i < graphAdj.length; i++) {
    for (let j = 0; j < graphAdj[i].length; j++) {
      graphAdj[i][j] = 0;
    }
  }
}

const dfs = (node) => {
  stack.push(node);
  while (!stack.isEmpty()) {
    node = stack.pop();
    if (visited[node] == false) {
      visited[node] = true;
      console.log(`we visited ${node}`)
      for (let j = 0; j < graphAdj[node].length; j++) {
        if (graphAdj[node][j] === 1) {
          stack.push(j);
        }
      }
    }
  }
}
