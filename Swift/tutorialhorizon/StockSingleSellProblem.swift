import Foundation

//http://algorithms.tutorialhorizon.com/stock-single-sell-problem-on-solution/

//Stock Single Sell Problem ¡X O(n) Solution

// int[] prices = {200, 500, 1000, 700, 30, 400, 900, 400, 50};
// Output: Maximum Profit: 870, buy date index: 4, sell date index: 6

func maxProfit(prices : [Int]) {

  var maxSellPrice = 0
  var profit = 0
  var buyDate = 0
  var sellDate = 0
  
  for index in stride(from: (prices.count-1) , through: 1, by: -1) {
    if(prices[index] > maxSellPrice) {
      maxSellPrice = prices[index]
      sellDate = index
    } else if (profit < maxSellPrice - prices[index]) {
      profit = maxSellPrice - prices[index]
      buyDate = index
    }
  }
  
  print("Buy date \(buyDate)")
  print("Sell date \(sellDate)")
  print("Maximum profit \(profit)")
}

maxProfit(prices : [200, 500, 1000, 700, 30, 400, 900, 400, 50])

