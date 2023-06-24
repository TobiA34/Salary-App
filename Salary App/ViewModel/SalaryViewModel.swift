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

extension SalaryType {
    var title: String {
        switch self {
        case .monthly:
            return "Monthly"
        case .weekly:
            return "Weekly"
        case .daily:
            return "Daily"
        }
    }
}

struct SalaryViewModel {
    
    /// Calculate user salary based on type
    /// - Parameters:
    ///   - salary: User salary as a decimal representation
    ///   - type: Calculated amount weekly, monthly or daily
    /// - Returns: Final calculated salary 
    func calculate(salary: Double, type: SalaryType) -> Double {
        
        var result: Double = 0
        
        switch type {
        case .monthly:
            result =  salary / 12.0
        case .weekly:
            result =  salary / 52.0 / 7.5
        case .daily:
            result =  salary / 52.0
        }
        return floor(result * 100) / 100
    }
    
}


