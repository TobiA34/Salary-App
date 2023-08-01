//
//  PensionComponent.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 27/07/2023.
//

import UIKit

 
class PensionView: UIView {
    
    weak var delegate: FormInputDelegate!
    private var id: String

    private lazy var pensionStackView: UIStackView = {
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
    
    private lazy var pensionLbl: UILabel = {
        let SalaryDescdLbl = UILabel()
        SalaryDescdLbl.textColor = .black
        SalaryDescdLbl.text = "Enter pension contribution"
        SalaryDescdLbl.translatesAutoresizingMaskIntoConstraints = false
        return SalaryDescdLbl
    }()
    
    private lazy var pensionTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.textColor = .black
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftView = paddingView
        textField.placeholder = "Please enter pension Contribution (%)"
        textField.leftViewMode = .always
        textField.keyboardType = .asciiCapableNumberPad
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    init(id: String) {
        self.id = id
        super.init(frame: .zero)
        setup()
    }
    
   @objc func enterPension() {
       if let pensionInput = pensionTextField.text,
          let pensionDelegate = delegate {
           pensionDelegate.didEnter(id: id, input: pensionInput)
       }
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}

extension PensionView {
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        pensionTextField.addTarget(self, action: #selector(enterPension), for: .editingChanged)
        let keyboardToolbar = UIToolbar()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        keyboardToolbar.sizeToFit()
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.pensionTextField.inputAccessoryView = keyboardToolbar
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        pensionTextField.leftView = paddingView
        pensionTextField.leftViewMode = .always
        
        self.addSubview(pensionStackView)
        pensionStackView.addArrangedSubview(pensionLbl)
        pensionStackView.addArrangedSubview(pensionTextField)
        
        NSLayoutConstraint.activate([
            pensionStackView.topAnchor.constraint(equalTo: self.topAnchor),
            pensionStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pensionStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pensionStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            pensionTextField.heightAnchor.constraint(equalToConstant: 44),

        ])
    }
}
