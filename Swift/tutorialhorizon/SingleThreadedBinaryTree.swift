import Foundation

// http://algorithms.tutorialhorizon.com/single-threaded-binary-tree-complete-implementation/

// Insert node into tree
// Print or tra­verse the tree.( here we will see the advan­tage of threaded tree)

class Node {
    var leftNode : Node? = nil
    var rightNode : Node? = nil
    var value : Int
    var hasRightThread : Bool
    
    init (_ value : Int) {
        self.value = value;
        self.hasRightThread = false;
    }
}

class ThreadBinaryTree {
    static var rootNode : Node?
    
    init (node : Node) {
        ThreadBinaryTree.rootNode = node
    }
    
    func insert(value : Int) {
        let newNode = Node(value)
        var currentNode = ThreadBinaryTree.rootNode
        var parentNode : Node? = nil
        var isFinished = false

        while(!isFinished) {
            parentNode = currentNode
            print("current : \((currentNode?.value)!)")
            // if current.data is greater than n that means we go to the left of the root
            if ((currentNode?.value)! > value) {
                currentNode = currentNode?.leftNode
                if (currentNode == nil) {
                    parentNode?.leftNode = newNode
                    newNode.rightNode = parentNode
                    newNode.hasRightThread = true
                    isFinished = true
                    print("Insert into left : \(value)")
                }
            } else {
            // if current.data is smaller than n that means we need to go to the right of the root
                if((currentNode?.hasRightThread)!) {
                    let temp = currentNode?.rightNode
                    currentNode?.rightNode = newNode
                    newNode.rightNode = temp
                    newNode.hasRightThread = true
                    isFinished = true
                    print("Insert into right with thread : \(value)")
                } else {
                    currentNode = currentNode?.rightNode;
                    if(currentNode == nil) {
                        parentNode?.rightNode = newNode;
                        isFinished = true
                        print("Insert into right without thread : \(value)")
                    }
                }
                
            }
            
        }
    }
    
    func tra­verse() {
        
        var node = leftDepthNode(ThreadBinaryTree.rootNode);
        
        
        //now travel using right pointers
        while(node != nil) {
            print("\((node?.value)!), ")
            
            if((node?.hasRightThread)!) {
                node = node?.rightNode
            }
            else {
                node = leftDepthNode(node?.rightNode);
            }
        }

    }
    
    func leftDepthNode(_ node : Node?) -> Node? {
        if (node == nil) {
            return nil
        } else {
            var tempNode = node
            while(tempNode?.leftNode != nil) {
                tempNode = tempNode?.leftNode
            }
            
            return tempNode
        }
    }
}

let rootNode = Node(10)

let tree = ThreadBinaryTree(node : rootNode)
tree.insert(value : 5)
tree.insert(value : 3)
tree.insert(value : 4)
tree.insert(value : 9)
tree.insert(value : 12)
tree.insert(value : 11)
tree.insert(value : 13)

print("----- Start traversing -----")
tree.tra­verse()
