//
//  PensionContributionCalculator.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

struct PensionContributionCalculator {
    
    func calculate(salary: Double, percentage: Double) -> Double? {
        // Monthly = 30,000 * 0.2 / 12 = 500
        let totalPercentage = percentage / 100 // 0.2
        let monthlyContribution = (salary * totalPercentage) / 12
        return monthlyContribution
    
    }
}
