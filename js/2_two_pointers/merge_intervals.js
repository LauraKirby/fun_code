const mergeIntervals = (listA, listB) => {
  const output = [];
  let counter = 0;

  for (let i = 0; i < listA.length; i++) {
    const intervalA = listA[i];
    const [lowA, highA] = intervalA;
    let lastValue = listA[i][1];

    // more remaining elements in A, push the rest of A into output
    if (counter >= listB.length) {
      for (let k = counter; k < listB.length; k++) {
        output.push(intervalA);
      }
    } else {
      while (counter < listB.length && listB[counter][0] < lastValue) {
        console.log(lastValue, " > ", listB[counter][0]);
        const intervalB = listB[counter];
        const [lowB, highB] = intervalB;

        // [[0, 2],[4, 8]]
        // [[1, 3], [5, 6], [9, 10]]
        if (lowA < lowB) {
          if (highA < lowB) {
            output.push(intervalA);
          } else if (highA > lowB) {
            const highRight = Math.max(highA, highB);
            const lowLeft = Math.min(lowA, lowB);
            output.push([lowLeft, highRight]);
          }
        }

        // [[3,5],[],[]]
        // [[1,6],[],[]]
        if (lowA > lowB) {
          if (highA > lowB) {
            output.push(intervalB);
          } else if (highA < lowB) {
            const highRight = Math.max(highA, highB);
            const lowLeft = Math.min(lowA, lowB);
            output.push([lowLeft, highRight]);
          }
        }

        console.log("lastValue: ", lastValue);
        lastValue = output.at(-1)[1];
        counter++;
      }
    }
  }

  // more remaining elements in B, push the rest of B into output
  if (counter < listB.length) {
    for (let k = counter; k < listB.length; k++) {
      output.push(listB[k]);
    }
  }

  return output;
};

//  ----------------------------------- Test 1 -----------------------------------
const a = [
  [0, 2],
  [4, 8],
];
const b = [
  [1, 3],
  [5, 6],
  [9, 10],
];

const test1 = mergeIntervals(a, b);
console.log("actual: ", test1, "-- expected: ", [
  [0, 3],
  [4, 8],
  [9, 10],
]);

//  ----------------------------------- Test 2 -----------------------------------
const c = [
  [0, 2],
  [3, 5],
];
const d = [[1, 100]];

const test2 = mergeIntervals(c, d);
console.log("actual: ", test2, "-- expected: ", [[0, 100]]);
