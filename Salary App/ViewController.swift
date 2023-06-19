//
//  ViewController.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 09/06/2023.
//

import UIKit
import SafariServices


class ViewController: UIViewController {
    
    //Annual salary ÷ 52 = weekly rate
    // (Annual salary ÷ 52)÷ 7.5 = Hourly rate
    //Annual salary ÷ 12 = Monthly rate
    
    private lazy var salaryTextField: UITextField = {
        let  salaryTextField = UITextField()
        salaryTextField.placeholder = "Please enter salary"
        salaryTextField.layer.borderWidth = 3
        salaryTextField.layer.borderColor = UIColor(named: "salary")?.cgColor
        salaryTextField.textColor = UIColor(named: "salary")
        salaryTextField.layer.cornerRadius = 16
        salaryTextField.keyboardType = .asciiCapableNumberPad
        salaryTextField.translatesAutoresizingMaskIntoConstraints = false
        salaryTextField.addTarget(self, action:  #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        salaryTextField.accessibilityIdentifier = "salaryTextField"
        return salaryTextField
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var monthlySalaryLbl: UILabel = {
        let  monthlySalaryLbl = UILabel()
        monthlySalaryLbl.textColor = UIColor(named: "salary")
        monthlySalaryLbl.text = "Monthly Total: £0 "
        monthlySalaryLbl.translatesAutoresizingMaskIntoConstraints = false
        monthlySalaryLbl.accessibilityIdentifier = "monthlySalaryLbl"
        return monthlySalaryLbl
    }()
    
    private lazy var weeklySalaryLbl: UILabel = {
        let  weeklySalaryLbl = UILabel()
        weeklySalaryLbl.textColor = UIColor(named: "salary")
        weeklySalaryLbl.text = "Weekly Total: £0"
        weeklySalaryLbl.translatesAutoresizingMaskIntoConstraints = false
        weeklySalaryLbl.accessibilityIdentifier = "weeklySalaryLbl"
        return weeklySalaryLbl
    }()
    
    
    private lazy var dailySalaryLbl: UILabel = {
        let  dailySalaryLbl = UILabel()
        dailySalaryLbl.textColor = UIColor(named: "salary")
        dailySalaryLbl.text = "Daily Total: £0"
        dailySalaryLbl.translatesAutoresizingMaskIntoConstraints = false
        dailySalaryLbl.accessibilityIdentifier = "dailySalaryLbl"
        return dailySalaryLbl
    }()
    
    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.currencyCode = Locale.current.language.region?.identifier
        formatter.numberStyle = .currency
        return formatter
    }()
    
    private let salaryViewModel = SalaryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: Safari Link
private extension ViewController {
    
    private func openLink(_ stringURL: String) {
        guard let url = URL(string: stringURL) else {
            // We should handle an invalid stringURL
            return
        }
        
        // Present SFSafariViewController
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .formSheet
        present(safariVC, animated: true, completion: nil)
    }
    
    @objc func displayAdvice() {
        openLink("https://www.pagepersonnel.co.uk/advice/salary-centre/salary-advice")
    }
}

// MARK: Layout
private extension ViewController {
    
    func setup() {
        // Inital view and navigation bar setup
        view.backgroundColor = UIColor(named: "darkMode")
        navigationController?.navigationBar.topItem?.title = "My Salary Calculator"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "darkMode")]
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(displayAdvice))
        
        // This is adding padding to the textfield
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        salaryTextField.leftView = paddingView
        salaryTextField.leftViewMode = .always
        
        // This sets up the done button on keyboard
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.salaryTextField.inputAccessoryView = keyboardToolbar
        
        
        //Laying out the views on the screen
        
        view.addSubview(salaryTextField)
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
        ])
    }
}

// MARK: TextField Actions

private extension ViewController {
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func textFieldDidChange() {
        print(salaryTextField.text ?? "")
        let salary = Double(self.salaryTextField.text!) ?? 0.0

        let monthlySalary = salaryViewModel.calculate(salary: salary, type: .monthly)
        let dailySalary =  salaryViewModel.calculate(salary: salary, type: .daily)
        let weeklySalary = salaryViewModel.calculate(salary: salary, type: .weekly)
        
        let formattedMonthlySalary =  numberFormatter.string(for: monthlySalary) ?? "-"
        let formattedWeeklySalary =  numberFormatter.string(for: weeklySalary) ?? "-"
        let formattedDailySalary =  numberFormatter.string(for: dailySalary) ?? "-"
        
        monthlySalaryLbl.text = "Monthly Total: \(formattedMonthlySalary)"
        weeklySalaryLbl.text = "Weekly Total: \(formattedWeeklySalary)"
        dailySalaryLbl.text = "Daily Total: \(formattedDailySalary)"
    }
}
