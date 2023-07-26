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
 
        switch studentLoanPlan {
        case .planOne:
            let monthlySalary =  salary / 12
            let result = monthlySalary - 1834
            let newResult = result * normalRate
            return newResult
        case .planTwo:
            let monthlySalary =  salary / 12
            let result = monthlySalary - 2274
            let newResult = result * normalRate
            return newResult
        case .planFour:
            let monthlySalary =  salary / 12
            let result = monthlySalary - 2305
            let newResult = result * normalRate
            return newResult
        case .planFive:
            let monthlySalary =  salary / 12
            let result = monthlySalary - 2083
            let newResult = result * normalRate
            return newResult
        case .postgraduateLoan:
            let monthlySalary =  salary / 12
            let result = monthlySalary - 1750
            let newResult = result * postgraduateRate
            return newResult
        }
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
