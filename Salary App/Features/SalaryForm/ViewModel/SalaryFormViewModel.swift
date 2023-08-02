//
//  SalaryFormViewModel.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

class SalaryFormViewModel {
    private let taxCalculator: TaxCalculator
    private let niCalculator: NICalculator
    private let studentLoanCalculator: StudentLoanCalculator
    private let pensionContributionCalculator: PensionContributionCalculator?
    private let studentLoanPlan: StudentLoanPlan
    private var salaryVal: Double!
    private var pensionVal: Double!

    init(taxCalculator: TaxCalculator,
         niCalculator: NICalculator,
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
    func calculateMonthlySalary(input: FormInputManager) -> Double {
        salaryVal = input.convert(value: input.salary)
        pensionVal = input.convert(value: input.pension)

        let totalNiTax = niCalculator.calculate(salary:salaryVal) - taxCalculator.calculate(salary : salaryVal)
        let pensionContributionStudentLoan =  (pensionContributionCalculator?.calculate(salary: salaryVal,
                                                                                        pensionPercentage: pensionVal) ?? 0) - studentLoanCalculator.calculate(
                                                                                            salary: salaryVal,
                                                                                            studentLoanPlan : studentLoanPlan)
        let result = (salaryVal / 12) - (pensionContributionStudentLoan - totalNiTax)
        return floor(result * 100) / 100
    }
    /// Calculate daily salary using salary form
    /// - Parameters:
    ///   - salaryForm: salary form  using struct
    /// - Returns: Final calculated daily salary
    func calculateDailySalary(input: FormInputManager) -> Double {
        salaryVal = input.convert(value: input.salary)
        pensionVal = input.convert(value: input.pension)

        let totalNiTax = niCalculator.calculate(salary: salaryVal) - taxCalculator.calculate(salary: salaryVal)
        let pensionContributionStudentLoan =  (pensionContributionCalculator?.calculate(salary: salaryVal,
                                                                                    pensionPercentage: pensionVal) ?? 0) - studentLoanCalculator.calculate(
                                                                                            salary: salaryVal,
                                                                                            studentLoanPlan: studentLoanPlan)
        let weeklyResult = (salaryVal / 52)
        let result = weeklyResult - pensionContributionStudentLoan - totalNiTax
        let dailyResult = result / 5
        return floor(dailyResult * 100) / 100
    }
    /// Calculate weekly salary using salary form
    /// - Parameters:
    ///   - salaryForm: salary form  using struct
    /// - Returns: Final calculated weekly salary
    func calculateWeeklySalary(input: FormInputManager) -> Double {
        salaryVal = input.convert(value: input.salary)
        pensionVal = input.convert(value: input.pension)
        let totalNiTax = niCalculator.calculate(salary:salaryVal) - taxCalculator.calculate(salary: salaryVal)
        let pensionContributionStudentLoan =  (pensionContributionCalculator?.calculate(salary: salaryVal,
                                                                                    pensionPercentage: pensionVal) ?? 0) - studentLoanCalculator.calculate(
                                                                                            salary: salaryVal,
                                                                                            studentLoanPlan: studentLoanPlan)
        let weeklyResult = (salaryVal / 52)
        let result = weeklyResult - pensionContributionStudentLoan - totalNiTax
        return floor(result * 100) / 100
    }
    /// Calculate hourly salary using salary form
    /// - Parameters:
    ///   - salaryForm: salary form  using struct
    /// - Returns: Final calculated hourly salary
    func calculateHourlySalary(input: FormInputManager) -> Double {

        salaryVal = input.convert(value: input.salary)

        let hoursWorked = (7.5 * 5.0 * 52)/12
        let result = (salaryVal / 12)
        let total = result / hoursWorked
        return floor(total * 100) / 100
    }
}
