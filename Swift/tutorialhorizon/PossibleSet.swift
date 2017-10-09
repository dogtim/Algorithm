import Foundation

// http://algorithms.tutorialhorizon.com/print-all-possible-subsets-with-sum-equal-to-a-given-number/

class PossibleSet {
    
    let number : Int
    
    func show(n : Int, result : String) {
        var current : String = result;
        if (n == 0) {
            print("Set \(result)")
            return
        } else {
            for index in 1...n {
                let concatedStr = String(index)
                current = current + concatedStr

                show(n : (n - index), result: current)
                //Recovery
                let start = current.index(current.startIndex, offsetBy: 0)
                let end = current.index(current.endIndex, offsetBy: -(concatedStr.count))
                current = String(current[start..<end])
            }
        }
        
    }
    
    init (n : Int) {
        number = n
    }
    
    func start() {
        show(n : number, result: "")
    }
}

let set = PossibleSet(n : 11)
set.start()


