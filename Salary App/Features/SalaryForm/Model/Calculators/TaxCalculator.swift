//
//  TaxCalculator.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

enum TaxBracket {
    case PersonalAllowance
    case BasicRate
    case HigherRate
    case AdditionalRate
}

struct TaxCalculator {

    func calculate(salary: Double) -> Double {
        if salary <= 12570 {
          //Monthly Tax = (Annual Salary * Tax Rate) / 12
            return (salary * 0) / 12
        } else if salary >= 12571 && salary <= 50270 {
            let basicRate = (salary * 0.2) / 12
            return floor(basicRate * 10) / 10
        } else if salary >= 50271 && salary <= 125140 {
            let higherRate = (salary * 0.4) / 12
            return floor(higherRate * 10) / 10
        } else {
            return  (salary * 4.5) / 12
        }
    }
}
