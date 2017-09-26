import Foundation

// 枚舉「數字 1 到 8 選擇五次」全部可能的情形
// 求有幾種組合 ?

// [1, 2, 3, 4, 5], [1, 2, 3, 4, 6]

var solution = Array(repeating:0 , count: 5)
var result = 0

func backtracking(_ n : Int) {
  if(n == 5) {
    printSolution()
    return
  }
  
  for index in 1...8 { 
    solution[n] = index
    backtracking(n + 1)
  }
  
}

func printSolution() {
  /*for index in solution {
    print(index, terminator: " ")
  }*/
  result = result + 1
  //print(solution) -> [1, 2, 3, 4, 5]
}

backtracking(0)
print("solution :\(result)")