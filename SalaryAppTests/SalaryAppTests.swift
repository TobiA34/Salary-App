//
//  SalaryAppTests.swift
//  SalaryAppTests
//
//  Created by Tobi Adegoroye on 19/06/2023.
//

import XCTest
@testable import Salary_App

final class SalaryAppTests: XCTestCase {

    
    var salaryVm: SalaryViewModel!
    var salary: Double = 54000
 
    func testMonthlySalaryLogic() {
        let monthlySalary = salaryVm.calculate(salary: salary, type: .monthly)
        XCTAssertEqual(monthlySalary,4500)
    }

    func testWeeklySalaryLogic()  {
        let weeklySalary = salaryVm.calculate(salary: salary, type: .weekly)
        XCTAssertEqual(weeklySalary,138.46)
    }
    
    func testDailySalaryLogic() {
        let dailySalary = salaryVm.calculate(salary: salary, type: .daily)
        XCTAssertEqual(dailySalary,1038.46)
        
    }
    
    func testHourlySalaryLogic() {
        let hourlySalary = salaryVm.calculate(salary: salary, type: .hourly)
        XCTAssertEqual(hourlySalary,27.69)
    }
    
    override func tearDown() {
        super.tearDown()
        salaryVm = nil
        salary = 0
    }
    
    override func setUp() {
        super.setUp()
        salaryVm = SalaryViewModel()
        salary = 54000
    }
    
}
