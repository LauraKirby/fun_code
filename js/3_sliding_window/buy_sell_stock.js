// two pointers approach
var maxProfit = function(prices) {
  // initial starting location
  let [left, right] = [0,1]
  // default or no profit response
  let maxProfit = 0

  while(right < prices.length) {
      // if profitable, 
      // check if it is more profitable than maxProfit
      if(prices[left] < prices[right]){
          const currentProfit = prices[right] - prices[left]
          maxProfit = Math.max(maxProfit, currentProfit)
      // price left is greater than price right
      // we want to buy at the cheaper option
      // update left to the cheaper day (right)
      } else {
          left = right
      }
      // update right forward one day
      right++
  }

  return maxProfit
};

