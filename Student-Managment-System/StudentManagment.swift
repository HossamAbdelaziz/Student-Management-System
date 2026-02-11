//
//  StudentManagment.swift
//  Student-Managment-System
//
//  Created by Hossam Abdelaziz on 2026-02-06.
//  Student ID : 991584502
//
import Foundation


class StudentManagment{
    
    private var students: [Student] = []
    
    
    // this function will add a new object in the array 
    func addStudent(_ student: Student){

        students.append(student)
    }
    
    // this function will return all students in the array
    func getAllStudents() -> [Student] {
        return students
    }
    
    
    // this function will check if the student with the ID is already there or not so that helps not to have duplicats
    func containStudent(withId id: Int ) -> Bool {
        
        for s in students {
            
            if s.id == id {
                return true
            }
        }
        return false
    }
    
    // find a student by ID search
func findStudent(byId id: Int) -> Student? {
    for s in students {
        if s.id == id {
            return s
        }
    }
    return nil
}
}


