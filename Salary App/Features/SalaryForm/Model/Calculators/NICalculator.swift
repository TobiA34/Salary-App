//
//  NICalculator.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

struct NICalculator {
    
    /// Calculate user ni based on salary
    /// - Parameters:
    ///   - salary: User salary as a decimal representation
    /// - Returns: Final calculated ni
    func calculate(salary: Double) -> Double {    
        var result = 0.0
 
        if salary >= 1048 && salary <= 4189 {
          result = (salary / 12) * 0.1325
        } else if salary < 6725 {
          result = 0.0
        } else if salary >= 9880 && salary <= 50270 {
            result = (salary / 12) * 0.1025
        } else {
            result = (salary / 12) * 0.0325
        }
        return result
    }
}
