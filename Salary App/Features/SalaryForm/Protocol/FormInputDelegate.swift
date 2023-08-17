//
//  FormInputDelegate.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 31/07/2023.
//

import Foundation

enum FormID: String {
    case salary
    case pension
    case studentLoan
    case submit
}




protocol FormInputDelegate: AnyObject {
    func didEnter(id: String, input: String)
}

protocol StudentLoanViewDelegate: AnyObject {
    func  didSelect(id: String, input: String)
}


protocol ButtonViewDelegate: AnyObject {
    func didCalculate(id: String)
}
