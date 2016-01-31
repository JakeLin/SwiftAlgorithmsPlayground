//: # Insertion Sort

import Foundation

func insertionSort(var numbers: [Int]) -> [Int] {
  var iterations = 0
  var insertions = 0
  for x in 1..<numbers.count {
    print("numbers[x]=\(numbers[x])")
    for y in 0..<x {
      print("numbers[y]=\(numbers[y])")
      iterations += 1
      if numbers[x] < numbers[y] {
        let temp = numbers[x]
        numbers.removeAtIndex(x)
        numbers.insert(temp, atIndex: y)
        insertions += 1
        print("\(insertions): \(numbers)")
        break
      }
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
