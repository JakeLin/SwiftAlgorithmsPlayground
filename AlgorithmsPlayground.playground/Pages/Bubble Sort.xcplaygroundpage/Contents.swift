//: [Previous](@previous)

//: # Bubble Sort

//: ![Bubble Sort GIF](https://upload.wikimedia.org/wikipedia/commons/c/c8/Bubble-sort-example-300px.gif)

import Foundation

func bubbleSort(var numbers: [Int]) -> [Int] {
  var iterations = 0
  var swaps = 0
  for x in 0..<numbers.count-1 {
    for y in 0..<numbers.count-1-x {
      iterations += 1
      if numbers[y] > numbers[y+1] {
        swaps += 1
        swap(&numbers[y], &numbers[y+1])
      }
      print("\(iterations) - \(swaps): \(numbers)")
    }
  }
  print("Interactions: \(iterations), swaps: \(swaps)")
  return numbers
}

let numbers = Int.randomNumbers(10)
print("Unsorted numbers: \(numbers)")

let sortedNumbers = bubbleSort(numbers)
print("Sorted numbers: \(sortedNumbers)")

//: [Next](@next)
