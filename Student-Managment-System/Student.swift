//
//  Student.swift
//  Student-Managment-System
//
//  Created by Hossam Abdelaziz on 2026-02-06.
//


import Foundation

class Student {
    
    var id : Int
    
    var name : String
    
    var grades : [Double]
    
    
    init(id: Int, name: String, grades: [Double]) {
        
        self.id = id
        
        self.name = name
        
        self.grades = grades
        
    }
    
   func averageGrade() -> Double {
        
        
       if grades.count == 0 {
           return 0.0
       }
       
       var total: Double = 0.0
       for grade in grades {
           total = total + grade
       }
       return total / Double(grades.count)
    }

    func isPassing(threshold: Double ) -> Bool {
        
        if averageGrade() >= threshold {
            return true
        } else {
            return false
        }
        
    }
    
}





