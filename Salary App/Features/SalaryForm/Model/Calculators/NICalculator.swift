//
//  NICalculator.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

struct NICalaculator {
    
    func calculate(salary: Double) -> Double {
       // £30,000 - £9,568 = £20,432
      // (£20,432 * 0.12) / 12 = £204.32

        let ni = salary - 9568
        let total = (ni * 0.12)/12
        let doubleStr = String(format: "%.2f", total) // "3.14"

        return Double(doubleStr) ?? 0
    }
}
