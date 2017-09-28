import Foundation

//枚舉 abcd 所有排列

let characters = ["a", "b", "c", "d"]
var solutions = [String]()
var used = [Bool]()
var count = 0

for char in characters {
    solutions.append("-")
    used.append(false)
}

func backtracking(_ level : Int) {
  if(level == (characters.count)) {
    print("Solution : \n")
    for index in solutions {
      print(index, terminator: " ")
      
    }
    print("\n")
    count = count + 1
    return
  }
  
  for (id, _) in characters.enumerated() {
    
    if(!used[id]) {
      used[id] = true
      
      //Key point to keep current level value
      solutions[level] = characters[id]

      backtracking(level + 1)
      used[id] = false
    }
  }
  
}

backtracking(0)
print("result count : \(count)")