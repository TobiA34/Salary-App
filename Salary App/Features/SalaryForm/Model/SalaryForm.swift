//
//  SalaryForm.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

struct SalaryForm {
    let salary: Double
    let pensionContributions: Double?
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
