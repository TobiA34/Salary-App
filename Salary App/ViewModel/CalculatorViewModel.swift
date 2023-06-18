//
//  Calculator.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 15/06/2023.
//

import Foundation

enum SalaryType {
    case monthly
    case weekly
    case daily
}

class CalculatorViewModel {
    
    var monthlySalary: Decimal?
    var weeklySalary: Decimal?
    var dailySalary: Decimal?
    

    
    func calculate(salary: Decimal, salaryType: SalaryType) {
 
        switch salaryType {
        case .monthly:
            monthlySalary =  salary / 12.0
        break
        case .weekly:
             dailySalary =  (salary / 52.0) / 7.5
        break
        case .daily:
             weeklySalary =  (salary / 52.0)
        break
        }
        
    }
    
}

