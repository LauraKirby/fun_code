import { describe, expect, it } from '@jest/globals';
import { isPowerOfTwo, sum } from './sum';

describe('adds 1 + 2 to equal 3', () => {
  it('adds', () => {
    expect(sum(1, 2)).toBe(3);
  })
});

describe('isPowerOfTwo', () => {
  it('returns true when the number is a power of 2', () => {
    expect(isPowerOfTwo(4)).toBe(true);
  })
});


describe('isPowerOfTwo', () => {
  it('returns true when the number is negative', () => {
    expect(isPowerOfTwo(-4)).toBe(true);
  })
});
