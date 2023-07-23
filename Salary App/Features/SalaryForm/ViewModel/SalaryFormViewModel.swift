//
//  SalaryFormViewModel.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

class SalaryFormViewModel {
    
    private let taxCalculator: TaxCalculator
    private let niCalculator: NICalaculator
    private let studentLoanCalculator: StudentLoanCalculator
    private let pensionContributionCalculator: PensionContributionCalculator?
    private let studentLoanPlan: StudentLoanPlan

    init(taxCalculator: TaxCalculator,
         niCalculator: NICalaculator,
         studentLoanCalculator: StudentLoanCalculator,
         pensionContributionCalculator: PensionContributionCalculator,
         studentLoanPlan: StudentLoanPlan) {
        self.taxCalculator = taxCalculator
        self.niCalculator = niCalculator
        self.studentLoanCalculator = studentLoanCalculator
        self.pensionContributionCalculator = pensionContributionCalculator
        self.studentLoanPlan = studentLoanPlan
      }
    
    /// Calculate monthly salary using salary form
    /// - Parameters:
    ///   - salaryForm: salary form  using struct
    /// - Returns: Final calculated monthly salary
    func calculateMonthlySalary(salaryForm: SalaryForm) -> Double {
        let totalNiTax = taxCalculator.calculate(salary: salaryForm.salary) -  niCalculator.calculate(salary: salaryForm.salary)
        
        let pensionContributionStudentLoan =  pensionContributionCalculator?.calculate(salary: salaryForm.salary, pensionPercentage: salaryForm.pensionContributions ?? 0) ?? 0  - studentLoanCalculator.calculate(salary: salaryForm.salary, studentLoanPlan: studentLoanPlan)
        
        let result = salaryForm.salary / 12 - pensionContributionStudentLoan - totalNiTax
        return floor(result * 100) / 100
    }
    
    /// Calculate daily salary using salary form
    /// - Parameters:
    ///   - salaryForm: salary form  using struct
    /// - Returns: Final calculated daily salary
    func calculateDailySalary(salaryForm: SalaryForm) -> Double {
        let totalNiTax = taxCalculator.calculate(salary: salaryForm.salary) -  niCalculator.calculate(salary: salaryForm.salary)
        
        let pensionContributionStudentLoan =  pensionContributionCalculator?.calculate(salary: salaryForm.salary, pensionPercentage: salaryForm.pensionContributions ?? 0) ?? 0  - studentLoanCalculator.calculate(salary: salaryForm.salary, studentLoanPlan: studentLoanPlan)
        
        let result = (salaryForm.salary / 52) - (pensionContributionStudentLoan - totalNiTax)
        
        return floor(result * 100) / 100
    }
        
    /// Calculate weekly salary using salary form
    /// - Parameters:
    ///   - salaryForm: salary form  using struct
    /// - Returns: Final calculated weekly salary
    func calculateWeeklySalary(salaryForm: SalaryForm) -> Double {
        let totalNiTax = taxCalculator.calculate(salary: salaryForm.salary) -  niCalculator.calculate(salary: salaryForm.salary)
        
        let pensionContributionStudentLoan =  pensionContributionCalculator?.calculate(salary: salaryForm.salary, pensionPercentage: salaryForm.pensionContributions ?? 0) ?? 0  - studentLoanCalculator.calculate(salary: salaryForm.salary, studentLoanPlan: studentLoanPlan)
        
        let result = (salaryForm.salary / 52) - (pensionContributionStudentLoan - totalNiTax) / 7.5
        
        return floor(result * 100) / 100
    }
    
    /// Calculate hourly salary using salary form
    /// - Parameters:
    ///   - salaryForm: salary form  using struct
    /// - Returns: Final calculated hourly salary
    func calculateHourlySalary(salaryForm: SalaryForm) -> Double {
        let totalNiTax = taxCalculator.calculate(salary: salaryForm.salary) -  niCalculator.calculate(salary: salaryForm.salary)
        
        let pensionContributionStudentLoan =  pensionContributionCalculator?.calculate(salary: salaryForm.salary, pensionPercentage: salaryForm.pensionContributions ?? 0) ?? 0  - studentLoanCalculator.calculate(salary: salaryForm.salary, studentLoanPlan: studentLoanPlan)
        
        let result = (salaryForm.salary / 52) - (pensionContributionStudentLoan - totalNiTax) / 37.5
        
        return floor(result * 100) / 100
    }
}

