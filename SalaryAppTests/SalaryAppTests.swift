//
//  SalaryAppTests.swift
//  SalaryAppTests
//
//  Created by Tobi Adegoroye on 19/06/2023.
//

import XCTest
@testable import Salary_App

final class SalaryAppTests: XCTestCase {
    var taxCalculator: TaxCalculator!
    var niCalculator: NICalaculator!
    var studentLoanCalculator: StudentLoanCalculator!
    var pensionContributionCalculator: PensionContributionCalculator!
    var salary = 0.0

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        taxCalculator = TaxCalculator()
        niCalculator = NICalaculator()
        studentLoanCalculator = StudentLoanCalculator()
        pensionContributionCalculator = PensionContributionCalculator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        taxCalculator = nil
        niCalculator = nil
        studentLoanCalculator = nil
        pensionContributionCalculator = nil
        salary = 0
    }

    func testNICalculation() throws {
         let ni = niCalculator.calculate(salary: 30000)
        XCTAssertEqual(ni,204.32)
    }
    
    func testCalculatingPersonalAllowance() throws {
        salary = 4500
        let tax = taxCalculator.calculate(salary: Double(salary))
        XCTAssertEqual(tax,0)
    }
    
    func testCalculatingBasicRate() throws {
        salary = 37700
        let tax = taxCalculator.calculate(salary: Double(salary))
        XCTAssertEqual(tax,628.3)
    }
    
    func testCalculatingHigherRate() throws {
        salary = 50271
        let tax = taxCalculator.calculate(salary: Double(salary))
        XCTAssertEqual(tax,1675.7)
 
    }
    func testCalculatingAdditionalRate() throws {
        salary = 125141
        let tax = taxCalculator.calculate(salary: Double(salary))
        XCTAssertEqual(tax,46927.875)
    }
    
    func testStudentLoanCalculation() throws {
        salary = 30000
        let studentLoan = studentLoanCalculator.calculate(salary: salary)
        XCTAssertEqual(studentLoan,225)

    }
    
    func testPensionContributionCalculator() throws{
        salary = 30000.0
        let percentage = 20.0
        let pensionContribution = pensionContributionCalculator.calculate(salary: salary, percentage: percentage)
        XCTAssertEqual(pensionContribution,500)
    }
    
    func testMonthlySalary() throws {
    salary = 30000.0
    let pensionContributions = 20.0
    let salaryFormVM = SalaryFormViewModel(taxCalculator: TaxCalculator(), niCalculator: NICalaculator(), studentLoanCalculator: StudentLoanCalculator(), pensionContributionCalculator: PensionContributionCalculator())
        
    let monthlyTotal = salaryFormVM.calculateMonthlySalary(salaryForm: SalaryForm(salary: salary, pensionContributions: pensionContributions))
        XCTAssertEqual(monthlyTotal,1704.32)
    }
    
    func testDailySalary() throws {
    salary = 30000.0
    let pensionContributions = 20.0
    let salaryFormVM = SalaryFormViewModel(taxCalculator: TaxCalculator(), niCalculator: NICalaculator(), studentLoanCalculator: StudentLoanCalculator(), pensionContributionCalculator: PensionContributionCalculator())
        
        let monthlyTotal = salaryFormVM.calculateDailySalary(salaryForm: SalaryForm(salary: salary, pensionContributions: pensionContributions))
        XCTAssertEqual(monthlyTotal,372.6)
    }
    
    func testHourlySalary() throws {
    salary = 30000.0
    let pensionContributions = 20.0
    let salaryFormVM = SalaryFormViewModel(taxCalculator: TaxCalculator(), niCalculator: NICalaculator(), studentLoanCalculator: StudentLoanCalculator(), pensionContributionCalculator: PensionContributionCalculator())
        
        let monthlyTotal = salaryFormVM.calculateHourlySalary(salaryForm: SalaryForm(salary: salary, pensionContributions: pensionContributions))
        XCTAssertEqual(monthlyTotal,571.47)
    }
    
    func testWeelySalary() throws {
    salary = 30000.0
    let pensionContributions = 20.0
    let salaryFormVM = SalaryFormViewModel(taxCalculator: TaxCalculator(), niCalculator: NICalaculator(), studentLoanCalculator: StudentLoanCalculator(), pensionContributionCalculator: PensionContributionCalculator())
        
        let monthlyTotal = salaryFormVM.calculateWeeklySalary(salaryForm: SalaryForm(salary: salary, pensionContributions: pensionContributions))
        XCTAssertEqual(monthlyTotal,549.68)
    }
    
    
    
   }


