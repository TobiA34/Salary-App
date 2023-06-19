//
//  SalaryAppUITests.swift
//  SalaryAppUITests
//
//  Created by Tobi Adegoroye on 19/06/2023.
//

import XCTest
@testable import Salary_App


final class SalaryAppUITests: XCTestCase {
    
    var app: XCUIApplication!
    

    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    

    
    func testTextFieldShouldFail() throws {
        //Test
        // Tap on textfield
        // Enter 540000
        // Compare to see if value in textfield equals 540000
        // Test should fail
        let salaryTextField = app.textFields["salaryTextField"]
        salaryTextField.tap()
        salaryTextField.typeText("540000")
        sleep(5)
        
        //Test should fail
        XCTAssertEqual(salaryTextField.value as! String, "340000")
        
    }
    
    
    func testTextFieldShouldPass() throws {
        //Test
        // Tap on textfield
        // Enter 540000
        // Compare to see if value in textfield equals 540000
        // Test should pass
        let salaryTextField = app.textFields["salaryTextField"]
        salaryTextField.tap()
        salaryTextField.typeText("540000")
        XCTAssertEqual(salaryTextField.value as! String, "540000")
    }
    
    func testTextFieldShouldExist() throws {
        //Test
        // This should pass because textfield exists
        let salaryTextField = app.textFields["salaryTextField"]
        XCTAssertTrue(salaryTextField.exists)
    }
    
    func testBarButtonShouldExists() throws {
        //Test
        // This should pass because textfield exists
        let infoBarButton = app.navigationBars.buttons.element(boundBy: 0)
        XCTAssertTrue(infoBarButton.exists)
    }
    
    
    func testBarButtonShouldOpenLink() throws {
        //Test
        // This should pass because textfield exists
        app.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    func testSalaryLablesDisplayCorrectValue() {
        let salaryTextField = app.textFields["salaryTextField"]
        salaryTextField.tap()
        salaryTextField.typeText("54000")
        
        let monthlySalaryLbl = app.staticTexts["monthlySalaryLbl"]
        let weeklySalaryLbl = app.staticTexts["weeklySalaryLbl"]
        let dailySalaryLbl = app.staticTexts["dailySalaryLbl"]

        XCTAssertEqual(monthlySalaryLbl.label, "Monthly Total: $4,500")
        XCTAssertEqual(weeklySalaryLbl.label, "Weekly Total: $138.46")
        XCTAssertEqual(dailySalaryLbl.label,"Daily Total: $1,038.46")

    }
}

extension String {
    var isNumber: Bool {
        return self.allSatisfy { character in
            character.isWholeNumber

        }
    }
}

extension String {
    var isDecimalNumber: Bool {
        let characters = CharacterSet.decimalDigits

        return CharacterSet(charactersIn: self).isSubset(of: characters)
    }
}
