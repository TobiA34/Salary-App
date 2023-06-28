//
//  ViewController.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 09/06/2023.
//

import UIKit
import SafariServices


class SalaryViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
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
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var salaryBreakdownTitle: UILabel = {
        let  salaryBreakdownTitle = UILabel()
        salaryBreakdownTitle.textColor = UIColor(named: "labels")
        salaryBreakdownTitle.text = "Salary Breakdown"
        salaryBreakdownTitle.translatesAutoresizingMaskIntoConstraints = false
        salaryBreakdownTitle.font = salaryBreakdownTitle.font.withSize(32)
        return salaryBreakdownTitle
    }()
    
 
    
    private lazy var monthlyTotalView: SalaryTotalView = {
        let monthlyTotalView = SalaryTotalView(type: .monthly)
        return monthlyTotalView
    }()
    
    
    private lazy var dailyTotalView: SalaryTotalView = {
        let dailyTotalView = SalaryTotalView(type: .daily)
        return dailyTotalView
    }()
    
    private lazy var weeklyTotalView: SalaryTotalView = {
        let weeklyTotalView = SalaryTotalView(type: .weekly)
        return weeklyTotalView
    }()
    
    private lazy var hourlyTotalView: SalaryTotalView = {
        let hourlyTotalView = SalaryTotalView(type: .hourly)
        return hourlyTotalView
    }()
    
    private lazy var salaryInfoVw: SalaryInfoView = {
        let salaryInfoVw = SalaryInfoView()
        return salaryInfoVw
    }()
    
    
    private lazy var salaryImageIInfoVw: SalaryImageInfoView = {
        let salaryImageIInfoVw = SalaryImageInfoView(salary: Salary(title: "Hello", description: "asdsasghsadjhdsagjhsdajhgdgsjajhgsdaghsad", image: "salaryIcon"))
        return salaryImageIInfoVw
    }()
    
    private lazy var salaryImageIInfoVw2: SalaryImageInfoView = {
        let salaryImageIInfoVw = SalaryImageInfoView(salary: Salary(title: "Hello", description: "asdsasghsadjhdsagjhsdajhgdgsjajhgsdaghsad", image: "salaryIcon"))
        return salaryImageIInfoVw
    }()
    private let salaryViewModel = SalaryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

// MARK: Safari Link
private extension SalaryViewController {
    
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
private extension SalaryViewController {
    func setup() {
        view.backgroundColor = UIColor(named: "darkMode")
        navigationController?.navigationBar.topItem?.title = "My Salary Calculator"
        self.navigationController?.navigationBar.prefersLargeTitles = true
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
 
        monthlyTotalView.delegate = self
        weeklyTotalView.delegate = self
        dailyTotalView.delegate = self
        hourlyTotalView.delegate = self

        //Laying out the views on the screen
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(salaryTextField)
        stackView.addArrangedSubview(monthlyTotalView)
        stackView.addArrangedSubview(weeklyTotalView)
        stackView.addArrangedSubview(dailyTotalView)
        stackView.addArrangedSubview(hourlyTotalView)
        stackView.addArrangedSubview(salaryImageIInfoVw)
        stackView.addArrangedSubview(salaryInfoVw)
        stackView.addArrangedSubview(salaryImageIInfoVw2)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -16),

            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            salaryTextField.heightAnchor.constraint(equalToConstant: 44)

            
            
        ])
    }
}

// MARK: TextField Actions

private extension SalaryViewController {
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func textFieldDidChange() {
        print(salaryTextField.text ?? "")
        let salary = Double(self.salaryTextField.text!) ?? 0.0
        
        let monthlySalary = salaryViewModel.calculate(salary: salary, type: .monthly)
        let dailySalary =  salaryViewModel.calculate(salary: salary, type: .daily)
        let weeklySalary = salaryViewModel.calculate(salary: salary, type: .weekly)
        let hourlySalary = salaryViewModel.calculate(salary: salary, type: .hourly)
        
        monthlyTotalView.update(total: monthlySalary)
        dailyTotalView.update(total: dailySalary)
        weeklyTotalView.update(total: weeklySalary)
        hourlyTotalView.update(total: hourlySalary)
        
    }
}

extension SalaryViewController: SalaryTotalViewDelegate {
    
    func didTapInfo(type: SalaryType) {
        print("user tapped on: \(type)")
        switch type {
        case .monthly:
            openLink("https://www.game.co.uk/")
        case .weekly:
            openLink("https://www.ign.com/uk")
        case .daily:
            openLink("https://www.designmynight.com/manchester/bars/secret-bars-manchester")
        case .hourly:
            openLink("https://stevenpcurtis.medium.com/create-a-uistackview-in-a-uiscrollview-e2a959fa061")
        }
    }
}
