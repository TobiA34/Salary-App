//
//  TaxCalculator.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

 
struct TaxCalculator {
    
    /// Calculate user tax based on salary
    /// - Parameters:
    ///   - salary: User salary as a decimal representation
    /// - Returns: Final calculated tax
    func calculate(salary: Double) -> Double {
        if salary <= 12570 {
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
