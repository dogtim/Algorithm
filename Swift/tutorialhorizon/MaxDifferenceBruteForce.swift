import Foundation

//http://algorithms.tutorialhorizon.com/maximum-difference-between-two-elements-where-larger-element-appears-after-the-smaller-element/

func maxDifference(nums : [Int]) {

  var maxNum = 0
  var maxdiff = 0
  
  for index in stride(from: (nums.count-1) , through: 1, by: -1) {
    if(nums[index] > maxNum) {
      maxNum = nums[index]
    } else if (maxdiff < maxNum - nums[index]) {
      maxdiff = maxNum - nums[index]
    }
  }

  print("Maximum diff \(maxdiff)")
}

maxDifference(nums : [22,2, 12, 5, 4, 7, 3, 19, 5])

