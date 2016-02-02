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
  
  // MARK: - print
  func printTree() {
    print("key=\(key), left=\(left?.key), right=\(right?.key)")
  }
  
  // MARK: - Private
  private func createNode(key: T) -> BinarySearchTree {
    let node = BinarySearchTree()
    node.key = key
    return node
  }
}

let binarySearchTree = BinarySearchTree<Int>()
binarySearchTree.printTree()


//: [Next](@next)
