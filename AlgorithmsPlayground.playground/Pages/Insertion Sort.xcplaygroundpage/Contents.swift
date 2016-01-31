//: # Insertion Sort

//: ![Insertion Sort GIF](https://upload.wikimedia.org/wikipedia/commons/0/0f/Insertion-sort-example-300px.gif)

import Foundation

func insertionSort(var numbers: [Int]) -> [Int] {
  var iterations = 0
  var insertions = 0
  for x in 1..<numbers.count {
    for y in 0..<x {
      iterations += 1
      if numbers[x] < numbers[y] {
        let temp = numbers[x]
        numbers.removeAtIndex(x)
        numbers.insert(temp, atIndex: y)
        insertions += 1
        print("\(iterations) - \(insertions): \(numbers)")
        break
      } else {
        print("\(iterations) - \(insertions): \(numbers)")
      }
    }
  }
  print("Interactions: \(iterations), insertions: \(insertions)")
  return numbers
}

let numbers = Int.randomNumbers(10)
print("Unsorted numbers: \(numbers)")

let sortedNumbers = insertionSort(numbers)
print("Sorted numbers: \(sortedNumbers)")

//: [Next](@next)
