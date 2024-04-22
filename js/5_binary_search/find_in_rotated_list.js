// https://leetcode.com/problems/search-in-rotated-sorted-array/

// There is an integer array nums sorted in ascending order (with distinct values).

// Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

// Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

// You must write an algorithm with O(log n) runtime complexity.

// Example 1:

// Input: nums = [4,5,6,7,0,1,2], target = 0
// Output: 4
// Example 2:

// Input: nums = [4,5,6,7,0,1,2], target = 3
// Output: -1
// Example 3:

// Input: nums = [1], target = 0
// Output: -1
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var search = function (nums, target) {
  let left = 0;
  let right = nums.length - 1;

  while (left <= right) {
    const midpoint = Math.floor((left + right) / 2);
    if (nums[midpoint] === target) {
      return midpoint;
    }

    // we are on the left side of the pivot point, or working with a sorted portion
    // is proven by:
    // nums[left] <= nums[midpoint]
    if (nums[left] <= nums[midpoint]) {
      // cases:
      //  1. t < nums[l] || t < nums[m], look right
      //  2. t <= nums[l], look left

      if (target > nums[midpoint] || target < nums[left]) {
        // look right
        left = midpoint + 1;
      } else {
        // look left
        right = midpoint - 1;
      }

      // we are on the right side of the list which looks like [7,0,1,2]
    } else {
      // cases:
      //   1. t < nums[m] || t < nums[r], look left
      //   2. t > nums[m] && t < nums[r], look right

      if (target < nums[midpoint] || target > nums[right]) {
        // look left
        right = midpoint - 1;
      } else {
        // look right
        left = midpoint + 1;
      }
    }
  }

  return -1;
};
