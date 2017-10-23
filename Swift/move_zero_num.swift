import Foundation
//Move zero num to right, other number's position could be randomly
var inputNums = [0, 3, 5, 0, 9, 11, 0, 15]

// expected result is : [3, 5, 9, 11, 15, 0, 0, 0] or [11, 15, 3, 5, 9, 0, 0, 0]

func moveZeroNumToRight(_ nums : inout [Int]) {
    
    if(nums.isEmpty) {
        print("Empty array")
        return
    }
    
    //index : be used to swap with zero num
    var index = nums.count - 1

    //iterate index
    var currentIndex = nums.count - 1
    
    while(currentIndex >= 0) {
        if(nums[currentIndex] == 0) {
            nums[currentIndex] = nums[index]
            nums[index] = 0
            index = index - 1
        }
        currentIndex = currentIndex - 1
    }
    
    print("\nOutput")
    for value in nums {
        print("\(value) ", terminator:"")
    }
    // 11 3 5 15 9 0 0 0
    print("\n")
}

moveZeroNumToRight(&inputNums)
