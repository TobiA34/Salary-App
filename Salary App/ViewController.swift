//
//  ViewController.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 09/06/2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Annual salary ÷ 52 = weekly rate
    // (Annual salary ÷ 52)÷ 7.5 = Hourly rate
    //Annual salary ÷ 12 = Monthly rate
    
    var monthlySalary: Decimal?
    var weeklySalary: Decimal?
    var dailySalary: Decimal?
    
    lazy var salaryTextField: UITextField = {
        let  salaryTextField = UITextField()
        salaryTextField.placeholder = "Please enter salary"
        salaryTextField.layer.borderWidth = 1
        salaryTextField.borderStyle = UITextField.BorderStyle.roundedRect
        salaryTextField.layer.borderColor = UIColor.black.cgColor
        salaryTextField.textColor = .black
        salaryTextField.layer.cornerRadius = 16
        salaryTextField.keyboardType = .asciiCapableNumberPad
        salaryTextField.translatesAutoresizingMaskIntoConstraints = false
        salaryTextField.delegate = self
        return salaryTextField
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var monthlySalaryLbl: UILabel = {
        let  monthlySalaryLbl = UILabel()
        monthlySalaryLbl.textColor = .black
        monthlySalaryLbl.text = "Monthly Total: £0 "
        monthlySalaryLbl.translatesAutoresizingMaskIntoConstraints = false
        return monthlySalaryLbl
    }()
    
    lazy var weeklySalaryLbl: UILabel = {
        let  weeklySalaryLbl = UILabel()
        weeklySalaryLbl.textColor = .black
        weeklySalaryLbl.text = "Weekly Total: £0"
        weeklySalaryLbl.translatesAutoresizingMaskIntoConstraints = false
        return weeklySalaryLbl
    }()
    
    
    lazy var dailySalaryLbl: UILabel = {
        let  dailySalaryLbl = UILabel()
        dailySalaryLbl.textColor = .black
        dailySalaryLbl.text = "Daily Total: £0"
        dailySalaryLbl.translatesAutoresizingMaskIntoConstraints = false
        return dailySalaryLbl
    }()
    
    lazy var submitBtn: UIButton = {
        var button = UIButton(type: .system)
        var config = UIButton.Configuration.filled()
        button.configuration = .filled()
        button.translatesAutoresizingMaskIntoConstraints = false
        config.cornerStyle = .capsule
        button.configuration = config
        return button
    }()
    
    
    private func addPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        salaryTextField.leftView = paddingView
        salaryTextField.leftViewMode = .always
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "My Salary Calculator"
        navigationController?.navigationBar.prefersLargeTitles = true
        setDoneOnKeyboard()
        addPadding()
        setScreenLayout()
    }
    
    func setDoneOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.salaryTextField.inputAccessoryView = keyboardToolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setScreenLayout() {
        
        submitBtn.setTitle("Calculate Salary", for: .normal)
        submitBtn.addTarget(self, action: #selector(submitBtnPressed), for: .touchUpInside)
        
        view.addSubview(salaryTextField)
        view.addSubview(submitBtn)
        view.addSubview(stackView)
        stackView.addArrangedSubview(monthlySalaryLbl)
        stackView.addArrangedSubview(weeklySalaryLbl)
        stackView.addArrangedSubview(dailySalaryLbl)
        
        
        NSLayoutConstraint.activate([
            salaryTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            salaryTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            salaryTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
            salaryTextField.heightAnchor.constraint(equalToConstant: 50),
            salaryTextField.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: salaryTextField.safeAreaLayoutGuide.topAnchor,constant: 84),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 48),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -48),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            
            
            submitBtn.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor,constant: 220),
            submitBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 48),
            submitBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -48),
            submitBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func presentError() {
        
        let alert = UIAlertController(title: "Salary", message: "You need to enter yearly", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @objc func submitBtnPressed() {
        
        let salary = Decimal(string:self.salaryTextField.text!) ?? 0.0
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.currencyCode = "GBP"
        formatter.numberStyle = .currency
        
        if salaryTextField.text == "" {
            presentError()
        }
        
        if salary != 0 {
            
            monthlySalary =  salary / 12.0
            dailySalary =  (salary / 52.0) / 7.5
            weeklySalary =  (salary / 52.0)
            
            let formattedMonthlySalary =  formatter.string(for: monthlySalary) ?? "?"
            let formattedWeeklySalary =  formatter.string(for: weeklySalary) ?? "?"
            let formattedDailySalary =  formatter.string(for: dailySalary) ?? "?"
            
            monthlySalaryLbl.text = "Monthly Total: \(formattedMonthlySalary)"
            weeklySalaryLbl.text = "Weekly Total: \(formattedWeeklySalary)"
            dailySalaryLbl.text = "Daily Total: \(formattedDailySalary)"
            
        }
        
    }
    
}


