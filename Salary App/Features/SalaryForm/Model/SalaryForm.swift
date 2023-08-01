//
//  SalaryForm.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

enum SalaryType {
    case monthly
    case weekly
    case daily
    case hourly
}


struct SalaryBreakdown {
    let monthlySalary: Double
    let dailySalary: Double
    let hourlySalary: Double
    let weeklySalary: Double
    let tax: Double
    let ni: Double
    let studentLoan: Double
    let originalSalary: Double
}

struct Salary {
    let title: String
    let description: String?
    let image: String
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
        case .hourly:
            return "Hourly"
        }
    }
}
