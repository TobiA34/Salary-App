//
//  ValidationManager.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation


struct FormInputValidation {
    let salary: String
    let pension: String?
    let minimumSalary: Double

}

enum FormError: Error,LocalizedError {
    case salaryContainsEmptyString
    case pensionContainsEmptyString
    case salaryFormContainsLetters
    case pensionFormContainsLetters
    case salaryIsBelowMin

    
    var errorTitle: String? {
        switch self {
        case .salaryContainsEmptyString:
            return "Salary textField contains empty string"
        case .pensionContainsEmptyString:
            return "Pension textField contains empty string"
        case .salaryFormContainsLetters:
            return "Salary textField contains letters"
        case .pensionFormContainsLetters:
            return "Pension textField contains letters"
        case .salaryIsBelowMin:
            return "Salary is below the minimum salary"

        }
    }
    
    var errorDescription: String {
        switch self {
        case .salaryContainsEmptyString:
            return "Salary textfield contains an empty string, please enter a value"
        case .pensionContainsEmptyString:
            return "Pension textfield contains an empty string, please enter a value"
        case .salaryFormContainsLetters:
            return "Salary textfield contains letters , please enter a number"
        case .pensionFormContainsLetters:
            return "Pension textfield contains letters , please enter a number"
        case .salaryIsBelowMin:
            return "This salary is below the minimum salary £12,000 , please enter a valid salary"
        }
    }
    
}

struct ValidationManager {
    /// Calculate weekly salary using salary form
    /// - Parameters:
    ///   - input:input   using struct FormInput
    /// - Returns: different validations
    func isValid(input: FormInputValidation) throws {
        let salarySet = CharacterSet(charactersIn: input.salary)
        let pensionSet = CharacterSet(charactersIn: input.pension ?? "")
        
        if input.salary.isEmpty {
            throw FormError.salaryContainsEmptyString
        } else if !CharacterSet.decimalDigits.isSuperset(of: salarySet) {
            throw FormError.salaryFormContainsLetters
        }
        else if !CharacterSet.decimalDigits.isSuperset(of: pensionSet) {
                 throw FormError.pensionFormContainsLetters
            } else if input.minimumSalary < 12000 {
                throw FormError.salaryIsBelowMin
                
            }
        }
        
    }

