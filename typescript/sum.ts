export const sum = (x: number, y: number): number => {
  return x + y;
}


// class Solution(object):

export const isPowerOfTwo = (n: number): boolean => {
  const powerOfTwo = Math.log2(n) % 1 === 0
  console.log(powerOfTwo)
  return powerOfTwo;
}

// """
//     : type n: int
// : rtype: bool
// """
