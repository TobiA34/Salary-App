//
//  TaxComponent.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 27/07/2023.
//

import UIKit


class TaxView: UIView {
    
    private lazy var taxCodeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.cornerRadius = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var taxCodeLbl: UILabel = {
        let taxCodeLbl = UILabel()
        taxCodeLbl.textColor = .black
        taxCodeLbl.text = "Enter Tax code: 1257L is the most common tax code"
        taxCodeLbl.numberOfLines = 0
        taxCodeLbl.translatesAutoresizingMaskIntoConstraints = false
        return taxCodeLbl
    }()
    
    private lazy var taxCodeTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.placeholder = "1257L"
        textField.text = "1257L"
        textField.textColor = .black
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}

extension TaxView {
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        let keyboardToolbar = UIToolbar()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        keyboardToolbar.sizeToFit()
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.taxCodeTextField.inputAccessoryView = keyboardToolbar
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        taxCodeTextField.leftView = paddingView
        taxCodeTextField.leftViewMode = .always
        
        self.addSubview(taxCodeStackView)
        taxCodeStackView.addArrangedSubview(taxCodeLbl)
        taxCodeStackView.addArrangedSubview(taxCodeTextField)
        
        NSLayoutConstraint.activate([
            taxCodeStackView.topAnchor.constraint(equalTo: self.topAnchor),
            taxCodeStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            taxCodeStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            taxCodeStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            taxCodeTextField.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}
