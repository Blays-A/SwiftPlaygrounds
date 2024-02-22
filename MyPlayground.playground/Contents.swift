// import UIKit

// var greeting = "Hello, playground"

// // Task 1 
// import Foundation

// // 1. Объединение двух строк
// print("1. Объединение двух строк:")
// let firstString = "Hello"
// let secondString = "World"
// let combinedString = firstString + secondString
// print("Результат объединения:", combinedString)

// // 2. Переворот строки
// print("\n2. Переворот строки:")
// let inputStringForReversal = "Swift"
// let reversedString = String(inputStringForReversal.reversed())
// print("Результат переворота:", reversedString)

// // 3. Подсчет символов
// print("\n3. Подсчет символов:")
// let inputStringForCount = "Count me!"
// let characterCount = inputStringForCount.filter { !$0.isWhitespace }.count
// print("Количество символов (без пробелов):", characterCount)

// // 4. Поиск подстроки
// print("\n4. Поиск подстроки:")
// let mainString = "Swift is awesome"
// let substringToSearch = "is"
// if let range = mainString.range(of: substringToSearch, options: .caseInsensitive) {
//     let index = mainString.distance(from: mainString.startIndex, to: range.lowerBound)
//     print("Первое вхождение подстроки \"\(substringToSearch)\" на позиции \(index)")
// } else {
//     print("Подстрока не найдена в строке.")
// }

//Lab3
//Number1
// class BankAccount {
//     let accountNumber: String
//     let accountOwner: String
//     private var balance: Double

//     init(accountNumber: String, accountOwner: String, startingBalance: Double) {
//         self.accountNumber = accountNumber
//         self.accountOwner = accountOwner
//         self.balance = startingBalance
//     }

//     func deposit(amount: Double) {
//         guard amount > 0 else {
//             print("Deposit amount must be greater than zero.")
//             return
//         }
//         balance += amount
//         print("Deposit of \(amount) successful. New balance: \(balance)")
//     }

//     func withdraw(amount: Double) {
//         guard amount > 0 else {
//             print("Withdrawal amount must be greater than zero.")
//             return
//         }
//         guard balance >= amount else {
//             print("Insufficient funds. Withdrawal unsuccessful.")
//             return
//         }
//         balance -= amount
//         print("Withdrawal of \(amount) successful. New balance: \(balance)")
//     }

//     func getBalance() -> Double {
//         return balance
//     }

//     func displayAccountInfo() {
//         print("Account Number: \(accountNumber)")
//         print("Account Owner: \(accountOwner)")
//         print("Current Balance: \(balance)")
//     }
// }

// // Пример использования класса BankAccount
// let account = BankAccount(accountNumber: "123456789", accountOwner: "John Doe", startingBalance: 1000.0)

// account.deposit(amount: 500)
// account.withdraw(amount: 200)
// account.withdraw(amount: 1500) // Попытка снять больше, чем есть на счету

// account.displayAccountInfo()


// //Number 2
// class Book {
//     let title: String
//     let author: String
//     let year: Int
//     let pageCount: Int
    
//     init(title: String, author: String, year: Int, pageCount: Int) {
//         self.title = title
//         self.author = author
//         self.year = year
//         self.pageCount = pageCount
//     }
    
//     func displayInfo() {
//         print("Title: \(title)")
//         print("Author: \(author)")
//         print("Year: \(year)")
//         print("Page Count: \(pageCount)")
//     }
// }

// class Library {
//     var books: [Book]
    
//     init() {
//         self.books = []
//     }
    
//     func addBook(book: Book) {
//         books.append(book)
//         print("Book '\(book.title)' added to the library.")
//     }
    
//     func removeBook(title: String) {
//         if let index = books.firstIndex(where: { $0.title == title }) {
//             let removedBook = books.remove(at: index)
//             print("Book '\(removedBook.title)' removed from the library.")
//         } else {
//             print("Book with title '\(title)' not found in the library.")
//         }
//     }
    
//     func displayAllBooks() {
//         if books.isEmpty {
//             print("Library is empty.")
//         } else {
//             print("Books in the library:")
//             for book in books {
//                 book.displayInfo()
//                 print("------------")
//             }
//         }
//     }
// }

// let library = Library()

// let book1 = Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", year: 1925, pageCount: 180)
// let book2 = Book(title: "To Kill a Mockingbird", author: "Harper Lee", year: 1960, pageCount: 324)

// library.addBook(book: book1)
// library.addBook(book: book2)

// library.displayAllBooks()

// library.removeBook(title: "The Great Gatsby")

// library.displayAllBooks()

//Lab3
import Foundation

struct Student {
    let firstName: String
    let lastName: String
    let averageGrade: Double
}

class StudentJournal {
    var students: [Student] = []

    func addStudent(firstName: String, lastName: String, averageGrade: Double) {
        let student = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
        students.append(student)
    }

    func removeStudent(firstName: String, lastName: String) {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
    }

    func displayStudents() {
        for student in students {
            print("Name: \(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
        }
    }

    func listStudentsByDescendingGPA() {
        let sortedStudents = students.sorted { $0.averageGrade > $1.averageGrade }
        for student in sortedStudents {
            print("Name: \(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
        }
    }

    func averageGradeOfAllStudents() -> Double? {
        guard !students.isEmpty else { return nil }
        let totalGrades = students.reduce(0.0) { $0 + $1.averageGrade }
        return totalGrades / Double(students.count)
    }

    func studentWithHighestGPA() -> Student? {
        return students.max(by: { $0.averageGrade < $1.averageGrade })
    }
}

let journal = StudentJournal()

journal.addStudent(firstName: "John", lastName: "Doe", averageGrade: 3.8)
journal.addStudent(firstName: "Jane", lastName: "Smith", averageGrade: 4.0)
journal.addStudent(firstName: "Alice", lastName: "Johnson", averageGrade: 3.5)

print("All Students:")
journal.displayStudents()
print()

journal.removeStudent(firstName: "John", lastName: "Doe")

print("Students after removing John Doe:")
journal.displayStudents()
print()

print("Students by descending GPA:")
journal.listStudentsByDescendingGPA()
print()

if let averageGrade = journal.averageGradeOfAllStudents() {
    print("Average GPA of all students: \(averageGrade)")
} else {
    print("No students in the journal.")
}

if let highestGPAStudent = journal.studentWithHighestGPA() {
    print("Student with highest GPA: \(highestGPAStudent.firstName) \(highestGPAStudent.lastName), GPA: \(highestGPAStudent.averageGrade)")
} else {
    print("No students in the journal.")
}
//Задание 2
import Foundation

struct Task {
    let title: String
    let description: String
    var isCompleted: Bool
}

class ToDoList {
    var tasks: [Task] = []
    
    func addTask(title: String, description: String) {
        let task = Task(title: title, description: description, isCompleted: false)
        tasks.append(task)
    }
    
    func removeTask(title: String) {
        tasks.removeAll { $0.title == title }
    }
    
    func changeTaskStatus(title: String, isCompleted: Bool) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks[index].isCompleted = isCompleted
        }
    }
    
    func displayTasks() {
        for task in tasks {
            print("Title: \(task.title), Description: \(task.description), Completed: \(task.isCompleted ? "Yes" : "No")")
        }
    }
    
    func displayCompletedTasks() {
        let completedTasks = tasks.filter { $0.isCompleted }
        print("Completed Tasks:")
        for task in completedTasks {
            print("Title: \(task.title), Description: \(task.description)")
        }
    }
    
    func displayOutstandingTasks() {
        let outstandingTasks = tasks.filter { !$0.isCompleted }
        print("Outstanding Tasks:")
        for task in outstandingTasks {
            print("Title: \(task.title), Description: \(task.description)")
        }
    }
    
    func clearCompletedTasks() {
        tasks.removeAll { $0.isCompleted }
    }
}



let toDoList = ToDoList()


toDoList.addTask(title: "Task 1", description: "Description of Task 1")
toDoList.addTask(title: "Task 2", description: "Description of Task 2")
toDoList.addTask(title: "Task 3", description: "Description of Task 3")


print("All Tasks:")
toDoList.displayTasks()
print()


toDoList.changeTaskStatus(title: "Task 2", isCompleted: true)

toDoList.displayCompletedTasks()
print()

toDoList.displayOutstandingTasks()
print()


toDoList.removeTask(title: "Task 1")


print("Tasks after removing Task 1:")
toDoList.displayTasks()
print()


toDoList.clearCompletedTasks()


print("Tasks after clearing completed tasks:")
toDoList.displayTasks()


