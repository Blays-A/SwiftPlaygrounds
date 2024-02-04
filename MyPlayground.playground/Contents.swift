import UIKit

var greeting = "Hello, playground"

// Task 1 
import Foundation

// 1. Объединение двух строк
print("1. Объединение двух строк:")
let firstString = "Hello"
let secondString = "World"
let combinedString = firstString + secondString
print("Результат объединения:", combinedString)

// 2. Переворот строки
print("\n2. Переворот строки:")
let inputStringForReversal = "Swift"
let reversedString = String(inputStringForReversal.reversed())
print("Результат переворота:", reversedString)

// 3. Подсчет символов
print("\n3. Подсчет символов:")
let inputStringForCount = "Count me!"
let characterCount = inputStringForCount.filter { !$0.isWhitespace }.count
print("Количество символов (без пробелов):", characterCount)

// 4. Поиск подстроки
print("\n4. Поиск подстроки:")
let mainString = "Swift is awesome"
let substringToSearch = "is"
if let range = mainString.range(of: substringToSearch, options: .caseInsensitive) {
    let index = mainString.distance(from: mainString.startIndex, to: range.lowerBound)
    print("Первое вхождение подстроки \"\(substringToSearch)\" на позиции \(index)")
} else {
    print("Подстрока не найдена в строке.")
}

