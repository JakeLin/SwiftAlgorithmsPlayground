//: [Previous](@previous)

//: # Linked List

//: [WikiPeida | Linked List](https://en.wikipedia.org/wiki/Linked_list)

import Foundation

class Node<T> {
  var value: T?
  var previous: Node?
  var next: Node?
  
  init(value: T?) {
    self.value = value
  }
}

class LinkedList<T> {
  var current: Node<T>?
  var head: Node<T>?
  var tail: Node<T>?
  
  private var previous: Node<T>?
  
  func printAllNodes() {
    print("Start printing all nodes")
    if let head = head {
      printNode(head)
    }
    print("Finsh printing all nodes")
  }
  
  func printNode(node: Node<T>) {
    print(node.value)
    if let next = node.next {
      printNode(next)
    }
  }
  
  func addNode(node: Node<T>) {
    if current == nil {
      // the first one is head
      head = node
    }
    
    // save the current as previous node
    previous = current
    
    // new current node
    current?.next = node
    node.previous = previous
    current = node
    
    // the newest one is tail
    tail = current
  }
}

let linkedList = LinkedList<Int>()

for i in 0..<10 {
  let node = Node<Int>(value: i)
  linkedList.addNode(node)
}

linkedList.printAllNodes()


//: [Next](@next)