//
//  InputManager.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 01/08/2023.
//

import Foundation


class FormInputManager {
    var salary: String
    var pension: String
    var studentLoan: String
    
    init(salary: String = "", pension: String = "" , studentLoan: String = "") {
        self.salary = salary
        self.pension = pension
        self.studentLoan = studentLoan
    }
    
    /// convert string into a double
    /// - Parameters:
    /// - Value: Form input value
    /// - Returns: Final  converted value
    func convert(value: String) -> Double {
         return Double(value) ?? 0
    }
    
 
}
