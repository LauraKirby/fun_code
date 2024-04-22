/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var search = function (nums, target) {
  let left = 0;
  let right = nums.length - 1;

  for (let i = 0; i < nums.length; i++) {
    const midpoint = Math.floor((left + right) / 2);

    if (nums[midpoint] === target) {
      return midpoint;
    }
    if (nums[midpoint] > target) {
      // if current value is too big
      // move left by updating right to a smaller index
      // subtract 1 since we already checked the current midpoint
      right = midpoint - 1;
    } else {
      // else current value is too small
      // move right by updated left to a bigger index
      // add 1 since we already checked the current midpoint
      left = midpoint + 1;
    }
  }

  return -1;
};

/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var search = function (nums, target) {
  let [left, right] = [0, nums.length - 1];

  while (left <= right) {
    midpoint = Math.ceil((left + right) / 2);

    if (nums[midpoint] === target) {
      return midpoint;
    } else if (nums[midpoint] < target) {
      console.log("looking right");
      left = midpoint + 1;
    } else if (nums[midpoint] > target) {
      console.log("looking left");
      right = midpoint - 1;
    }
  }

  return -1;
};
