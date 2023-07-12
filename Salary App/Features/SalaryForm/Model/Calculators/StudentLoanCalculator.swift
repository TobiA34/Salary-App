//
//  StudentLoanCalculator.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation


struct StudentLoanCalculator {
    
    func calculate(salary: Double) -> Double {
        let rate = 0.09
        let studentLoan = (salary * rate) / 12
        print(studentLoan)
        return studentLoan
    
    }
    
}
