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
    var niCalculator: NICalculator!
    var studentLoanCalculator: StudentLoanCalculator!
    var pensionContributionCalculator: PensionContributionCalculator!
    var salaryFormVM: SalaryFormViewModel!
    var studentLoanPlan: StudentLoanPlan = .planOne
    var salary = 0.0

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        taxCalculator = TaxCalculator()
        niCalculator = NICalculator()
        studentLoanCalculator = StudentLoanCalculator()
        pensionContributionCalculator = PensionContributionCalculator()
       salaryFormVM = SalaryFormViewModel(taxCalculator: taxCalculator,
                                          niCalculator: niCalculator,
                                          studentLoanCalculator: studentLoanCalculator,
                                          pensionContributionCalculator: pensionContributionCalculator,
                                          studentLoanPlan: studentLoanPlan)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        taxCalculator = nil
        niCalculator = nil
        studentLoanCalculator = nil
        pensionContributionCalculator = nil
        salaryFormVM = nil
        salary = 0
    }

    func testNICalculation() throws {
         let ni = niCalculator.calculate(salary: 21000)
        XCTAssertEqual(ni,179.375)
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
        salary = 30000.0
        let studentLoan = studentLoanCalculator.calculate(salary: salary, studentLoanPlan: .planOne)
        XCTAssertEqual(studentLoan,59.94)

    }
    
    func testPensionContributionCalculator() throws{
        salary = 30000.0
        let percentage = 20.0
        let pensionContribution = pensionContributionCalculator.calculate(salary: salary, pensionPercentage: percentage)
        XCTAssertEqual(pensionContribution,500)
    }
    
    func testMonthlySalary() throws {
    salary = 30000.0
    let pensionContributions = 20.0
        let salaryFormVM = SalaryFormViewModel(taxCalculator: TaxCalculator(),
                                               niCalculator: NICalculator(),
                                               studentLoanCalculator: StudentLoanCalculator(),
                                               pensionContributionCalculator: PensionContributionCalculator(),
                                               studentLoanPlan: .planOne)

        let monthlyTotal = salaryFormVM.calculateMonthlySalary(input: FormInputManager(salary: "30000",pension: "0"))
        XCTAssertEqual(monthlyTotal,2316.19)
    }
    
    func testDailySalary() throws {
    salary = 30000.0
        let monthlyTotal = salaryFormVM.calculateDailySalary(input: FormInputManager(salary: "30000",pension: "0"))
        XCTAssertEqual(monthlyTotal,176.12)
    }
    
    func testHourlySalary() throws {
    salary = 30000.0
    let pensionContributions = 20.0
        
        let monthlyTotal = salaryFormVM.calculateHourlySalary(input: FormInputManager(salary: "30000",pension: "0"))
        XCTAssertEqual(monthlyTotal,15.38)
    }
    
    func testWeeklySalary() throws {
    salary = 30000.0
        let monthlyTotal = salaryFormVM.calculateWeeklySalary(input: FormInputManager(salary: "30000",pension: "0"))
        XCTAssertEqual(monthlyTotal,880.61)
    }
   }
