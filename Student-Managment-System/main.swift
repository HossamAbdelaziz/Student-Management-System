//
//  main.swift
//  Student-Managment-System
//
//  Created by Hossam Abdelaziz on 2026-02-06.
// Student ID : 991584502
//

import Foundation

let system = StudentManagment()

var students: [Student] = []

let s1 = Student(id: 100, name: "Hossam", grades: [55, 100, 100, 70])
let s2 = Student(id: 101, name: "Ali", grades: [70, 70, 80, 90])
let s3 = Student(id: 102, name: "Ahmed", grades: [60, 60, 60, 60])
let s4 = Student(id: 104, name: "Samir", grades: [20, 20, 20, 20])

system.addStudent(s1)
system.addStudent(s2)
system.addStudent(s3)
system.addStudent(s4)

func showMenu() {
    print(
        """
        ===== Student Managment System =====
        1. Add a new student 
        2. view all students 
        3. Calculate average grade for a student 
        4. Display passing or failing students 
        5. Exit 
        ========================================
        """
    )
}

// will add afunction to make the menu shows when the user say yes again
func askMenuAgain() -> Bool {
    while true {

        print("Do you want to see the meue again? (y/n)", terminator: " ")

        if let line = readLine() {

            let answer = line.trimmingCharacters(in: .whitespacesAndNewlines)
                .lowercased()

            if answer == "y" || answer == "yes" {
                return true
            }

            if answer == "n" || answer == "no" {
                return false

            }

        }
        print("Please Type 'y' to see the menu or 'n' to exit the program.")

}
}

// create a function to read an integer for the user with valication  and keep asking until the user types a vaild INT

func readInt(prompt: String) -> Int {

    while true {
        print(prompt, terminator: "")

        if let line = readLine() {

            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)

            if let number = Int(trimmed) {
                return number
            }
        }

        print("Invalid input. Please enter a valid number.")
    }

}

// Read a double entry form the user with validation

func readDouble(prompt: String) -> Double {

    while true {
        print(prompt, terminator: "")

        if let line = readLine() {

            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)

            if let number = Double(trimmed) {
                return number
            }
        }
        print("Invaild input. please enter a number (example 75 or 75.5")
    }
}

// a special func for non empty name from the user
func readNonEmptyString(prompt: String) -> String {

    while true {
        print(prompt, terminator: "")
        if let line = readLine() {

            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)

            if trimmed.count > 0 {
                return trimmed
            }
        }

        print("Invailed input . you can't leave it empty ")
    }

}

// create a function for reading grades for the array

func readGrades(prompt: String) -> [Double] {

    while true {
        print(prompt, terminator: " ")

        if let line = readLine() {
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)

            let parts = trimmed.split(separator: " ")

            if parts.count == 0 {
                print("please enter at least one grade")
                continue
            }

            var grades: [Double] = []
            var allVaild = true

            for p in parts {

                let text = String(p)

                if let number = Double(text) {
                    grades.append(number)
                } else {
                    allVaild = false
                    break
                }
            }
            if allVaild {
                return grades
            } else {
                print(
                    "Inavaild Grades , Please enter number only , Sperated by Spaces "
                )
            }
        } else {
            print("Invailed Input , Please Try Again")
        }
    }
}

// Feature to View all the Students

func viewAllStudents() {

    print("--- Student List ---")

    let students = system.getAllStudents()

    if students.count == 0 {
        print("No students found.")
        return
    }

    for s in students {

        print("ID:", s.id, ", Name:", s.name)

    }
}

// Add student block

func addStudentFLow() {

    print("Adding a Student:")

    // Read Id
    let id = readInt(prompt: "Enter Stdudent ID : ")

    // Prevent dublicats ids
    if system.containStudent(withId: id) {
        print("Error : A student with this ID: already exists")
        return
    }

    // read the name
    let name = readNonEmptyString(prompt: "Enter student name : ")

    //ready the grades
    let grades = readGrades(prompt: "Enter the grades sperated by spaces : ")

    // create the whole object and add it to the system
    let newStudent = Student(id: id, name: name, grades: grades)
    system.addStudent(newStudent)

    print("Student added Successfully!")
}

//calculate the average grades
func calculateAverageFlow() {
    print("---- Calculating Avergge Grade ----")

    // ask for ID
    let id = readInt(
        prompt: "Enter Student ID to calculate the average grades: "
    )

    // ask the system to find the student
    let found = system.findStudent(byId: id)

    if found == nil {
        print("Error : Student ID not found.")
        return
    }

    let student = found!

    //calculate the average
    let avg = student.averageGrade()

    let avgText = String(format: "%.2f", avg)

    print("Average Grade for \(student.name) : \(avgText)")
}

// Passing or falling function

func passingFailingFlow() {
    print("--- Displaying Passing or Failing Students ----")

    let threshold = readDouble(prompt: "Enter grade thershold: ")

    let students = system.getAllStudents()

    if students.count == 0 {
        print("no Students Found.")
        return
    }

    var passing: [Student] = []
    var failing: [Student] = []

    for s in students {
        if s.isPassing(threshold: threshold) {
            passing.append(s)
        } else {
            failing.append(s)
        }
    }

    print("--- Passing Students ---")
    if passing.count == 0 {
        print("None")
    } else {
        for s in passing {
            let avgText = String(format: "%.2f", s.averageGrade())
            print("ID:", s.id, "Name:", s.name, "Avrage:", avgText)
        }
    }

    print("--- Failing Studnets ---")
    if failing.count == 0 {
        print("None")
    } else {
        for s in failing {
            let avgText = String(format: "%.2f", s.averageGrade())
            print("ID:", s.id, "Name:", s.name, "Avrage:", avgText)

        }
    }

}

// main loop
var running = true

while running {

    showMenu()

    let choice = readInt(prompt: "Enter Your Choice : ")

    switch choice {

    case 1:
        addStudentFLow()

    case 2:
        viewAllStudents()

    case 3:

        calculateAverageFlow()

    case 4:
        passingFailingFlow()

    case 5:
        print("Exting the program , Good Bye !")
        running = false

    default:
        print("Invalid choice. Please try again.")
    }

    if running {
        let menuAgain = askMenuAgain()

        if menuAgain == false {
            print("Exiting the program see you tomorrow")
            running = false
        }
    }

    print("")
}
