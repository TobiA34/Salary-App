//
//  StudentLoanComponent.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 27/07/2023.
//

import UIKit


class StudentLoanView: UIView {
    
   weak var delegate: StudentLoanViewDelegate!
 
   private let studentLoanPlans = [StudentLoanPlan.planOne.rawValue,
                StudentLoanPlan.planTwo.rawValue,
                StudentLoanPlan.planFour.rawValue,
                StudentLoanPlan.planFive.rawValue,
                StudentLoanPlan.postgraduateLoan.rawValue
    ]
    
    private let salaryTypeTextField = UITextField()
    private var id: String
    
    private lazy var studentLoanStackView: UIStackView = {
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
    
    private lazy var studentLoanTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.textColor = .black
         let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.text = studentLoanPlans[0]
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
         return textField
    }()
    
    private lazy var studentLoanLbl: UILabel = {
        let taxCodeLbl = UILabel()
        taxCodeLbl.textColor = .black
        taxCodeLbl.text = "Please pick a student loan plan"
        taxCodeLbl.numberOfLines = 0
        taxCodeLbl.translatesAutoresizingMaskIntoConstraints = false
        return taxCodeLbl
    }()
    
    let pickerView = UIPickerView()

    
    init(id: String) {
        self.id = id
        super.init(frame: .zero)
        setup()
    }
    
    @objc func studentPickerDidChange() {
        
        if let studentLoanInput = studentLoanTextField.text {
            delegate.didSelect(id: FormID.studentLoan.rawValue, input: studentLoanInput)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}

extension StudentLoanView {
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        salaryTypeTextField.addTarget(self, action: #selector(studentPickerDidChange), for: .editingChanged)
        let keyboardToolbar = UIToolbar()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        keyboardToolbar.sizeToFit()
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.studentLoanTextField.inputAccessoryView = keyboardToolbar
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        studentLoanTextField.leftView = paddingView
        studentLoanTextField.leftViewMode = .always
        self.salaryTypeTextField.inputAccessoryView = keyboardToolbar
        salaryTypeTextField.layer.borderColor = UIColor.black.cgColor
        salaryTypeTextField.layer.borderWidth = 1
        salaryTypeTextField.layer.cornerRadius = 16
        pickerView.delegate = self
        studentLoanTextField.inputView = pickerView
        
        self.addSubview(studentLoanStackView)
        studentLoanStackView.addArrangedSubview(studentLoanLbl)
        studentLoanStackView.addArrangedSubview(studentLoanTextField)
        
        NSLayoutConstraint.activate([
            studentLoanStackView.topAnchor.constraint(equalTo: self.topAnchor),
            studentLoanStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            studentLoanStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            studentLoanStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            salaryTypeTextField.heightAnchor.constraint(equalToConstant: 44),
            studentLoanTextField.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}


extension StudentLoanView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return studentLoanPlans.count
    }

    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return studentLoanPlans[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        studentLoanTextField.text = studentLoanPlans[row]
      }
}
