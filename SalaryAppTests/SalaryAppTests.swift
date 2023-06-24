//
//  SalaryAppTests.swift
//  SalaryAppTests
//
//  Created by Tobi Adegoroye on 19/06/2023.
//

import XCTest
@testable import Salary_App

final class SalaryAppTests: XCTestCase {

    
    let salaryVm = SalaryViewModel()
 
    func testMonthlySalaryLogic() {
        let monthlySalary = salaryVm.calculate(salary: 54000, type: .monthly)
        XCTAssertEqual(monthlySalary,4500)
    }

    func testWeeklySalaryLogic()  {
        let weeklySalary = salaryVm.calculate(salary: 54000, type: .weekly)
        XCTAssertEqual(weeklySalary,138.46)
    }
    
    func testDailySalaryLogic() {
        let dailySalary = salaryVm.calculate(salary: 54000, type: .daily)
        XCTAssertEqual(dailySalary,1038.46)
        
    }
    
}
