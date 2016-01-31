//: [Previous](@previous)

//: # Linked List

//: [WikiPeida | Linked List](https://en.wikipedia.org/wiki/Linked_list)

import Foundation

//: Linked List Node
class Node<T> {
  var value: T
  var previous: Node?
  var next: Node?
  
  init(value: T) {
    self.value = value
  }
}

//: Linked List
class LinkedList<T: Equatable> {
  var current: Node<T>?
  var head: Node<T>?
  var tail: Node<T>?
  var count: Int = 0
  
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
      // the first one is the head
      head = node
    }
    
    // save the previous current as the previous node
    previous = current
    
    // new current node
    current?.next = node
    node.previous = previous
    current = node
    
    // the newest one is the new tail
    tail = current
    
    // increas the count
    count += 1
  }
  
  func removeNodeAtIndex(index: Int) {
    guard index < count && index >= 0 else {
      fatalError("Index \(index) does not exist!")
    }
    
    var nodeToRemove = head
    for i in 0...index {
      // Find it
      if i == index {
        // It is the head
        if i == 0 {
          head = nodeToRemove?.next
        } else if (i == count-1) {
          tail = nodeToRemove?.previous
        }
        
        nodeToRemove?.previous?.next = nodeToRemove?.next
        nodeToRemove?.next?.previous = nodeToRemove?.previous
        count -= 1
        nodeToRemove = nil
        break
      }
      nodeToRemove = nodeToRemove?.next
    }
  }
}

//: Example
let linkedList = LinkedList<Int>()

for i in 0..<10 {
  let node = Node<Int>(value: i)
  linkedList.addNode(node)
}

print("linkedList.head=\(linkedList.head?.value)")
print("linkedList.tail=\(linkedList.tail?.value)")

linkedList.printAllNodes()

linkedList.removeNodeAtIndex(7)
print("linkedList.head=\(linkedList.head?.value)")
print("linkedList.tail=\(linkedList.tail?.value)")
linkedList.printAllNodes()

linkedList.removeNodeAtIndex(8)
print("linkedList.head=\(linkedList.head?.value)")
print("linkedList.tail=\(linkedList.tail?.value)")
linkedList.printAllNodes()

linkedList.removeNodeAtIndex(5)
print("linkedList.head=\(linkedList.head?.value)")
print("linkedList.tail=\(linkedList.tail?.value)")
linkedList.printAllNodes()

linkedList.removeNodeAtIndex(0)
print("linkedList.head=\(linkedList.head?.value)")
print("linkedList.tail=\(linkedList.tail?.value)")
linkedList.printAllNodes()

linkedList.removeNodeAtIndex(0)
print("linkedList.head=\(linkedList.head?.value)")
print("linkedList.tail=\(linkedList.tail?.value)")
linkedList.printAllNodes()

//: [Next](@next)
