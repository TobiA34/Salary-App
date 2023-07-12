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
 
    init(taxCalculator: TaxCalculator,
         niCalculator: NICalaculator,
         studentLoanCalculator: StudentLoanCalculator,
         pensionContributionCalculator: PensionContributionCalculator) {
        self.taxCalculator = taxCalculator
        self.niCalculator = niCalculator
        self.studentLoanCalculator = studentLoanCalculator
        self.pensionContributionCalculator = pensionContributionCalculator
     }
    
    func calculateMonthlySalary(salaryForm: SalaryForm) -> Double {
        let totalNiTax = taxCalculator.calculate(salary: salaryForm.salary) -  niCalculator.calculate(salary: salaryForm.salary)
        
        let pensionContributionStudentLoan =  pensionContributionCalculator?.calculate(salary: salaryForm.salary, percentage: salaryForm.pensionContributions ?? 0) ?? 0  - studentLoanCalculator.calculate(salary: salaryForm.salary)
        
        let result = salaryForm.salary / 12 - pensionContributionStudentLoan - totalNiTax
        return floor(result * 100) / 100
    }
    
    func calculateDailySalary(salaryForm: SalaryForm) -> Double {
        let totalNiTax = taxCalculator.calculate(salary: salaryForm.salary) -  niCalculator.calculate(salary: salaryForm.salary)
        
        let pensionContributionStudentLoan =  pensionContributionCalculator?.calculate(salary: salaryForm.salary, percentage: salaryForm.pensionContributions ?? 0) ?? 0  - studentLoanCalculator.calculate(salary: salaryForm.salary)
        
        let result = (salaryForm.salary / 52) - (pensionContributionStudentLoan - totalNiTax)
        
        return floor(result * 100) / 100
    }
    
    
    func calculateWeeklySalary(salaryForm: SalaryForm) -> Double {
        let totalNiTax = taxCalculator.calculate(salary: salaryForm.salary) -  niCalculator.calculate(salary: salaryForm.salary)
        
        let pensionContributionStudentLoan =  pensionContributionCalculator?.calculate(salary: salaryForm.salary, percentage: salaryForm.pensionContributions ?? 0) ?? 0  - studentLoanCalculator.calculate(salary: salaryForm.salary)
        
        let result = (salaryForm.salary / 52) - (pensionContributionStudentLoan - totalNiTax) / 7.5
        
        return floor(result * 100) / 100
    }
    
    func calculateHourlySalary(salaryForm: SalaryForm) -> Double {
        let totalNiTax = taxCalculator.calculate(salary: salaryForm.salary) -  niCalculator.calculate(salary: salaryForm.salary)
        
        let pensionContributionStudentLoan =  pensionContributionCalculator?.calculate(salary: salaryForm.salary, percentage: salaryForm.pensionContributions ?? 0) ?? 0  - studentLoanCalculator.calculate(salary: salaryForm.salary)
        
        let result = (salaryForm.salary / 52) - (pensionContributionStudentLoan - totalNiTax) / 37.5
        
        return floor(result * 100) / 100
    }
}

