//: [Previous](@previous)

//: # Linked List

//: [WikiPeida | Linked List](https://en.wikipedia.org/wiki/Linked_list)

import Foundation

//: Linked List Node
class Node<T: Equatable>: Equatable {
  private(set) var value: T
  private(set) var previous: Node?
  private(set) var next: Node?
  private(set) var uuid: String
  
  init(value: T) {
    self.value = value
    uuid = NSUUID().UUIDString
  }
}

func == <T: Equatable>(lhs: Node<T>, rhs: Node<T>) -> Bool {
  return lhs.uuid == rhs.uuid
}

//: Linked List
class LinkedList<T: Equatable> {
  private(set) var current: Node<T>?
  private(set) var head: Node<T>?
  private(set) var tail: Node<T>?
  private(set) var count: Int = 0
  
  func addNodeToTail(node: Node<T>) {
    // First node to the list
    if tail == nil {
      head = node
    } else {
      tail?.next = node
    }
    
    node.previous = tail
    
    // new tail
    tail = node
    
    // new current
    current = node
    
    // increas the count
    count += 1
  }
  
  func addNodeToHead(node: Node<T>) {
    // First node to the list
    if head == nil {
      tail = node
    }
    else {
      node.next = head
    }
    
    head?.previous = node
    
    // new tail
    head = node
    
    // new current
    current = node
    
    // increas the count
    count += 1
  }
  
//  func addNodeAfterCurrent(node: Node<T>) {
//    // If current is nil, this list is empty
//    if current == nil {
//      head = node
//      tail = node
//      current = node
//    } else {
//      current?.next = node
//      node.previous = current
//      
////      if current == head? {
////        current = node
////        
////      }
//    }
//    
//    
//    
//    // save the previous current as the previous node
//    previous = current
//    
//    // new current node
//    current?.next = node
//    node.previous = previous
//    current = node
//    
//    // the newest one is the new tail
//    tail = current
//    
//    // increas the count
//    count += 1
//  }
  
  func removeNodeAtIndex(index: Int) {
    guard index < count && index >= 0 else {
      fatalError("Index \(index) does not exist!")
    }
    
    var nodeToRemove = head
    for i in 0...index {
      print(i)
      // Find it
      if i == index {
        // It is the head
        if i == 0 {
          // Move current since head is to be removed.
          if current == head {
            current = head?.next
          }
        
          head = nodeToRemove?.next
        } else if (i == count-1) {
          // Move current since head is to be removed.
          if current == tail {
            current = tail?.previous
          }
          
          tail = nodeToRemove?.previous
        }
        
        nodeToRemove?.previous?.next = nodeToRemove?.next
        nodeToRemove?.next?.previous = nodeToRemove?.previous
        count -= 1
        nodeToRemove = nil
        if count == 0 {
          clear()
        }
        break
      }
      
      // Move the next one to find
      nodeToRemove = nodeToRemove?.next
    }
  }
  
  func clear() {
    current = head
    while current != nil {
      current = current?.next
      current?.previous = nil
    }
    
    head = nil
    tail = nil
    current = nil
  }

  // MARK: - print
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
  
  func printHead() {
    print("head=\(head?.value)")
  }
  
  func printTail() {
    print("tail=\(tail?.value)")
  }
  
  func printCurrent() {
    print("current=\(current?.value)")
  }
}

//: Example
let linkedList = LinkedList<Int>()

for i in 0..<10 {
  let node = Node<Int>(value: i)
  linkedList.addNodeToTail(node)
}

linkedList.printHead()
linkedList.printTail()
linkedList.printCurrent()
linkedList.printAllNodes()

linkedList.removeNodeAtIndex(9)
linkedList.printHead()
linkedList.printTail()
linkedList.printCurrent()
linkedList.printAllNodes()

linkedList.clear()
linkedList.printHead()
linkedList.printTail()
linkedList.printCurrent()
linkedList.printAllNodes()

//: [Next](@next)
