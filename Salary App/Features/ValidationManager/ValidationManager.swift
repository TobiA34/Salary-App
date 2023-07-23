//
//  ValidationManager.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import Foundation

struct FormInput {
    let text: String
    let number: Double?
}

enum FormError: Error {
    case containsEmptyString
    case formContainsLetters
    
    var errorTitle: String? {
        switch self {
        case .containsEmptyString:
            return "Contains Empty String"
        case .formContainsLetters:
            return "Form Contains Letters"
        }
    }
    
    var errorLocalDescription: String {
        switch self {
        case .containsEmptyString:
            return "The salary textfield contains an empty string, please enter a value"
        case .formContainsLetters:
            return "This textfield contains letters, please enter a number"
        }
    }
    
}

struct ValidationManager {
    /// Calculate weekly salary using salary form
    /// - Parameters:
    ///   - input:input   using struct FormInput
    /// - Returns: different validations
    func isValid(input: FormInput) throws {
        
        let set = CharacterSet(charactersIn: input.text)
        
        if input.text.isEmpty {
            throw FormError.containsEmptyString
        } else if !CharacterSet.decimalDigits.isSuperset(of: set) {
            throw FormError.formContainsLetters
        }
        
    }
}

