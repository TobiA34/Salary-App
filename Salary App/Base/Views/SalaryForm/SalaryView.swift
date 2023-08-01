//
//  SalaryComponent.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 27/07/2023.
//

import UIKit

class SalaryView: UIView {
    
    weak var delegate: FormInputDelegate!
    private var id: String
 
    private lazy var salaryTextFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var salaryTextFieldLbl: UILabel = {
        let SalaryTextFieldLbl = UILabel()
        SalaryTextFieldLbl.textColor = .black
        SalaryTextFieldLbl.text = "Enter Salary"
        SalaryTextFieldLbl.translatesAutoresizingMaskIntoConstraints = false
        return SalaryTextFieldLbl
    }()
    
    
    
    private lazy var salaryTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please enter salary"
        textField.layer.borderWidth = 1
        textField.textColor = .black
        textField.keyboardType = .asciiCapableNumberPad
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = "salaryTextField"
        return textField
    }()
    
    
    init(id: String, input: String) {
        self.id = id
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
      }
    
    @objc func enterSalary() {
         if let salaryInput = salaryTextField.text,
            let salaryDelegate = delegate {
            salaryDelegate.didEnter(id: id, input: salaryInput)

        }
    }
}


extension SalaryView {
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        salaryTextField.addTarget(self, action: #selector(enterSalary), for: .editingChanged)
        
        let keyboardToolbar = UIToolbar()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        keyboardToolbar.sizeToFit()
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.salaryTextField.inputAccessoryView = keyboardToolbar
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        salaryTextField.leftView = paddingView
        salaryTextField.leftViewMode = .always
        
        self.addSubview(salaryTextFieldStackView)
        salaryTextFieldStackView.addArrangedSubview(salaryTextFieldLbl)
        salaryTextFieldStackView.addArrangedSubview(salaryTextField)
        
        NSLayoutConstraint.activate([
            salaryTextFieldStackView.topAnchor.constraint(equalTo: self.topAnchor),
            salaryTextFieldStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            salaryTextFieldStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            salaryTextFieldStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            salaryTextField.heightAnchor.constraint(equalToConstant: 44),
            
        ])
    }
}

