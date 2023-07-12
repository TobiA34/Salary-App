//
//  ValidationManager.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

enum FormError: Error {
    case containsEmptyString
    case formContainsLetters
    case invalidSalary
    case isValidPenContribution
}

extension FormError: LocalizedError {
    var errorLocalDescription: String {
        switch self {
        case .containsEmptyString:
            return "The salary textfield contains an empty string, please enter a value"
        case .formContainsLetters:
            return "This textfield contains letters, please enter a number"
        case .invalidSalary:
            return "This is not a valid salary"
        case .isValidPenContribution:
            return "This is not a valid pension contribution"
        }
    }
}

struct ValidationManager {
    
    func isValid(texts: [String]) throws {
        for text in texts {
            if text.isEmpty {
                throw FormError.containsEmptyString
            }
        }

     }
    
    func inValidNumber(values: [String]) throws {
        
        for value in values {
            let set = CharacterSet(charactersIn: value)
            if !CharacterSet.decimalDigits.isSuperset(of: set) {
                throw FormError.formContainsLetters
            }
        }

    }
    
    func isValidSalary(number: Double) throws{
        if number <= 10000 {
            throw FormError.invalidSalary
        }
    }
    
    func isValidPenContribution(number: Double) throws {
        if number <= 0 {
            throw FormError.isValidPenContribution
        } else if number > 100 {
            throw FormError.isValidPenContribution
        }
    }
 
}

