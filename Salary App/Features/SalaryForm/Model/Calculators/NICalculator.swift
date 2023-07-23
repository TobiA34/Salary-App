//
//  NICalculator.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

struct NICalaculator {
    
    /// Calculate user ni based on salary
    /// - Parameters:
    ///   - salary: User salary as a decimal representation
    /// - Returns: Final calculated ni
    func calculate(salary: Double) -> Double {
       // £9,568 represents the primary threshold
        let ni = salary - 9568
        let total = (ni * 0.12)/12
        let result = floor(total*100)/100
        return result
    }
}
