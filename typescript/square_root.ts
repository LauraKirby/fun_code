function mySqrt(x: number): number {
  if (x === 0) {
    return x
  }
  let squareRoot = 0
  for (let i = 1; i * i <= x; i++) {
    squareRoot = i
  }

  return squareRoot
};
