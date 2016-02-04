//: [Previous](@previous)

//: # Queue

import Foundation

private class Node<T> {
  var key: T
  var next: Node<T>?
  
  init(key: T) {
    self.key = key
  }
  
  func printNode() {
    print("key:\(key)")
    if let next = next {
      next.printNode()
    }
  }
}

class Queue<T> {
  
  private var head: Node<T>?
  private var tail: Node<T>?
  
  func enqueue(key: T) {
    if tail == nil {
      // it is the first one is tail is nil
      head = createNode(key)
      tail = head
    } else {
      tail?.next = createNode(key)
      tail = tail?.next
    }
  }
  
  func dequeue() -> T? {
    if let head = head {
      let key = head.key
      if let next = head.next {
        self.head = next
      } else {
        // last node
        self.head = nil
        tail = nil
      }
      return key
    }
    return nil
  }
  
  private func createNode(key: T) -> Node<T> {
    let node = Node<T>(key: key)
    return node
  }
  
  //MARK - print
  func printAll() {
    print("Start printing")
    head?.printNode()
    print("Stop printing")
  }
}

//: - Examples
let queue = Queue<Int>()
for i in 0..<1000 {
  queue.enqueue(i)
}

var key = queue.dequeue()
while(key != nil) {
  print(key)
  key = queue.dequeue()
}

//: [Next](@next)
