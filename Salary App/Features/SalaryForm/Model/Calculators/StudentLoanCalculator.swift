//
//  StudentLoanCalculator.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

enum StudentLoanPlan: String {
    case planOne
    case planTwo
    case planFour
    case planFive
    case postgraduateLoan
}

struct StudentLoanCalculator {
    
    /// Calculate user student loan based on salary
    /// - Parameters:
    ///   - salary: User salary as a decimal representation
    /// - Returns: Final calculated student loan
    func calculate(salary: Double,studentLoanPlan: StudentLoanPlan) -> Double {
        let normalRate = 0.09
        let postgraduateRate = 0.06
        var newResult = 0.0
 
        switch studentLoanPlan {
        case .planOne:
            if salary >= 22015 {
                let monthlySalary =  salary / 12
                let result = monthlySalary - 1834
                newResult = result * normalRate
             }
        case .planTwo:
            if salary >= 27295 {
                let monthlySalary =  salary / 12
                let result = monthlySalary - 2274
                newResult = result * normalRate
            }
         case .planFour:
            if salary >= 27660 {
                let monthlySalary =  salary / 12
                let result = monthlySalary - 2305
                newResult = result * normalRate
            }
         case .planFive:
            if salary >= 25000 {
                let monthlySalary =  salary / 12
                let result = monthlySalary - 2083
                newResult = result * normalRate
            }
         case .postgraduateLoan:
            if salary >= 21000 {
                let monthlySalary =  salary / 12
                let result = monthlySalary - 1750
                newResult = result * postgraduateRate
            }
         }
        return newResult
    }
}


//
//        if  salary >= 22015 && salary <= 27660 {
//            let rate = 0.09
//            let result = (salary * rate) / 12
//            return result
//        } else if salary <= 21000 {
//            //105
//            let rate = 0.06
//            let result = (salary * rate) / 12
//            return result
//        }
//        return salary
