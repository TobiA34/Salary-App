//
//  PensionContributionCalculator.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

struct PensionContributionCalculator {
    
    /// Calculate user pension contribution based on salary
    /// - Parameters:
    ///   - salary: User salary as a decimal representation
    /// - Returns: Final calculated pension contribution
    func calculate(salary: Double, pensionPercentage: Double) -> Double? {
        let totalPercentage = pensionPercentage / 100
        let monthlyContribution = (salary * totalPercentage) / 12
        return monthlyContribution
    
    }
}
