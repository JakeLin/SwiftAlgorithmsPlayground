//: [Previous](@previous)

//: # Binary Search Tree

//: [WikiPeida | Binary Search Tree](https://en.wikipedia.org/wiki/Binary_search_tree)

import Foundation

class BinarySearchTree <T: Comparable> {
  var key: T?
  var left: BinarySearchTree<T>?
  var right: BinarySearchTree<T>?
  
  func addNode(key: T) {
    // No nodes, build a new tree
    if self.key == nil {
      self.key = key
      return
    }
    
    if self.key > key {
      // Insert to the left-hand side
      if let left = left {
        // left has node already
        left.addNode(key)
      } else {
        // new left node
        left = createNode(key)
      }
    } else if self.key < key {
      // Insert to the right-hand side
      if let right = right {
        // right has node already
        right.addNode(key)
      } else {
        // new right node
        right = createNode(key)
      }
    }
  }
  
  func find(key: T) -> Bool {
    // Start with the root
    if self.key == key {
      print("Find key:\(key)")
      return true
    } else if self.key > key {
      if let left = left {
        return left.find(key)
      } else {
        print("Cannot find key:\(key)")
        return false
      }
    } else /* if self.key < key */ {
      if let right = right {
        return right.find(key)
      } else {
        print("Cannot find key:\(key)")
        return false
      }
    }
  }
  
  var depth: Int {
    // empty tree
    if key == nil {
      return 0
    }
    
    // only have root
    if left == nil && right == nil {
      return 0
    }
    
    var leftDepth = 0
    if let left = left {
      leftDepth = left.depth
    }
    
    var rightDepth = 0
    if let right = right {
      rightDepth = right.depth
    }
    
    return max(leftDepth, rightDepth) + 1
  }
  
  var isBalanced: Bool {
    // empty tree
    if key == nil {
      return true
    }
    
    // only have root
    if left == nil && right == nil {
      return true
    }
    var leftDepth = 0
    if let left = left {
      leftDepth = left.depth
    }
    
    var rightDepth = 0
    if let right = right {
      rightDepth = right.depth
    }
    print("leftDepth=\(leftDepth), rightDepth=\(rightDepth)")
    return abs(leftDepth - rightDepth) <= 1
  }
  
  // MARK: - print
  func printKey() {
    print("key=\(key), left=\(left?.key), right=\(right?.key)")
  }
  
  // MARK: - Private
  private func createNode(key: T) -> BinarySearchTree {
    let node = BinarySearchTree()
    node.key = key
    return node
  }
}

//: Examples
//: - Add notes
//var binarySearchTree = BinarySearchTree<Int>()
//binarySearchTree.printKey()
//
//binarySearchTree.addNode(2)
//binarySearchTree.printKey()
//
//binarySearchTree.addNode(3)
//binarySearchTree.printKey()
//
//
//binarySearchTree.addNode(1)
//binarySearchTree.printKey()
//binarySearchTree.printKey()

//: - Find
//binarySearchTree.find(0)
//binarySearchTree.find(1)
//binarySearchTree.find(10)
//binarySearchTree.depth

//: - depth and balanced
let binarySearchTree = BinarySearchTree<Int>()
//let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] // worst case
//let numbers = [4, 3, 5, 1, 2, 6, 7] // balanced tree
//for i in numbers {
//  binarySearchTree.addNode(i)
//}
//binarySearchTree.depth
//binarySearchTree.isBalanced

let numbers = Int.randomNumbers(10)
for i in numbers {
  binarySearchTree.addNode(i)
}

binarySearchTree.depth
binarySearchTree.isBalanced


//: [Next](@next)
