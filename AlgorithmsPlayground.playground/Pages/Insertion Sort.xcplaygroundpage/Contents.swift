//: [Previous](@previous)

//: # Insertion Sort

import Foundation

func insertionSort(var numbers: [Int]) -> [Int] {
  var iterations = 0
  var insertions = 0
  for x in 1..<numbers.count {
    let key = numbers[x]
    print("key=\(key)")
    for var y = x-1; y >= 0; y -= 1 {
      print("numbers[y]=\(numbers[y])")
      if key < numbers[y] {
        numbers.removeAtIndex(y+1)
        numbers.insert(key, atIndex: y)
        
        insertions += 1
      }
      iterations += 1
      print("\(iterations): \(numbers)")
    }
  }
  print("Interactions: \(iterations), insertions: \(insertions)")
  return numbers
}

let numbers = Int.randomNumbers(10)
print("unsorted numbers: \(numbers)")

let sortedNumbers = insertionSort(numbers)
print("Sorted numbers: \(sortedNumbers)")

//: [Next](@next)
