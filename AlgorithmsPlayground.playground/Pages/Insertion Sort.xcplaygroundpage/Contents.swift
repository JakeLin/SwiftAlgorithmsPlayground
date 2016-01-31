//: [Previous](@previous)

//: # Insertion Sort

import Foundation

func insertionSort(var numbers: [Int]) -> [Int] {
  for (x, var value) in numbers.enumerate() {
    for y in 0...x {
      if numbers[y] > value {
        swap(&numbers[y], &value)
      }
    }
  }
  return numbers
}

let numbers = Int.randomNumbers(100)
let sortedNumbers = insertionSort(numbers)

//: [Next](@next)
