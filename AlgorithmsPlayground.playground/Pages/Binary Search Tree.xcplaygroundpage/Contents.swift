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
  
  func find(key: T) {
    // Start with the root
    if self.key == key {
      print("Find key:\(key)")
    } else if self.key > key {
      if let left = left {
        left.find(key)
      } else {
        print("Cannot find key:\(key)")
      }
    } else if self.key < key {
      if let right = right {
        right.find(key)
      } else {
      print("Cannot find key:\(key)")
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
      return 1
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

//: - Find
let binarySearchTree = BinarySearchTree<Int>()
let numbers = Int.randomNumbers(3)
for i in numbers {
  binarySearchTree.addNode(i)
}
binarySearchTree.depth

binarySearchTree.printKey()
binarySearchTree.find(0)
binarySearchTree.find(1)
binarySearchTree.find(10)
binarySearchTree.depth

//: [Next](@next)
