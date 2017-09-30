import Foundation

//8 Queen Problem

var solution = [Int]()

var occupyY = [Bool](repeating: false, count: 8)
var diagonalLeft = [Bool](repeating: false, count: 15)
var diagonalRight = [Bool](repeating: false, count: 15)

for _ in 0...7 { //checkerboard size
  solution.append(0)
}

func setEnable(y: Int, dl:Int, dr:Int, enable : Bool) {
  occupyY[y] = enable
  diagonalLeft[dl] = enable
  diagonalRight[dr] = enable
}

func backtrack(level : Int) {
  if(level == 8) {
    for value in solution {
      print(value, terminator: " ")
    }
    print("\n--------\n")
    return
  }
  
  for y in 0...7 { //checkerboard size
    let dl = (level + y) % 15
    let dr = (level - y + 15) % 15
    
    if (!occupyY[y] && !diagonalLeft[dl] && !diagonalRight[dr]) {
      // Mark queen's line
      setEnable(y: y, dl:dl, dr:dr, enable:true)
      solution[level] = y;
      backtrack(level : level+1);
 
      // Reset mark
      setEnable(y: y, dl:dl, dr:dr, enable:false)
    }
  }
  
}

backtrack(level:0)