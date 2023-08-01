//
//  FormViewController.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import UIKit
import SafariServices

class SalaryFormViewController: UIViewController {
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        stackView.layer.cornerRadius = 16
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var salaryComponent: SalaryView = {
        let salaryComponent = SalaryView(id: FormID.salary.rawValue, input: "")
        return salaryComponent
    }()
    
    private lazy var pensionComponent: PensionView = {
        let pensionComponent = PensionView(id: FormID.pension.rawValue)
        return pensionComponent
    }()
    
    private lazy var taxComponent: SalaryInfoView = {
        let taxComponent = SalaryInfoView(title: "Tax code", desc: "1257L is the most common tax code")
        return taxComponent
    }()
    
    private lazy var studentLoanComponent: StudentLoanView = {
        let studentLoanComponent = StudentLoanView(id: FormID.studentLoan.rawValue)
        
        return studentLoanComponent
    }()
    
    private lazy var buttonComponent: SubmitView = {
        let buttonComponent = SubmitView(id: FormID.submit.rawValue)
        return buttonComponent
    }()
    
    
    private let validationManager = ValidationManager()
    private let taxCalculator = TaxCalculator()
    private let niCalculator = NICalculator()
    private let studentLoanCalulator = StudentLoanCalculator()
    private let pensionCalculator = PensionContributionCalculator()
    private let studentLoanPlan = StudentLoanPlan.planOne
    private let formInput = FormInputManager()
    
    let salaryvm: SalaryFormViewModel!
    
    init() {
        self.salaryvm = SalaryFormViewModel(taxCalculator: taxCalculator, niCalculator: niCalculator, studentLoanCalculator: studentLoanCalulator, pensionContributionCalculator: pensionCalculator, studentLoanPlan: studentLoanPlan)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SalaryFormViewController {
    // MARK: Links
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

extension SalaryFormViewController {
    //MARK: Layout
    func setup() {
        view.backgroundColor = UIColor(named: "darkMode")
        navigationController?.navigationBar.topItem?.title = "My Salary Calculator"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(displayAdvice))
        salaryComponent.delegate = self
        pensionComponent.delegate = self
        studentLoanComponent.delegate = self
        buttonComponent.delegate = self
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(salaryComponent)
        stackView.addArrangedSubview(pensionComponent)
        stackView.addArrangedSubview(studentLoanComponent)
        stackView.addArrangedSubview(taxComponent)
        stackView.addArrangedSubview(buttonComponent)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
        ])
    }
}



extension SalaryFormViewController: FormInputDelegate {
    func didEnter(id: String, input: String) {
        switch id {
        case FormID.salary.rawValue:
            formInput.salary = input
        case FormID.pension.rawValue:
            formInput.pension = input
        default:
            break
        }
        
    }
}


extension SalaryFormViewController: StudentLoanViewDelegate {
    func didSelect(id: String, input: String) {
        switch id {
        case FormID.studentLoan.rawValue:
            formInput.salary = input
            break
        default:
            break
        }
    }
}


extension SalaryFormViewController: ButtonViewDelegate {
    func didCalculate(id: String) {
        switch id {
        case FormID.submit.rawValue:
            let salaryValue = Double(formInput.salary ) ?? 0
            let formInputValidation = FormInputValidation(salary: formInput.salary, pension: formInput.pension, minimumSalary: salaryValue)
            let formInputManager = FormInputManager(salary: formInput.salary, pension: formInput.pension)
            do {
                
                 try validationManager.isValid(input: formInputValidation)
                
                
                let monthlySalary =  salaryvm.calculateMonthlySalary(input: formInputManager )
                
                let dailySalary =  salaryvm.calculateDailySalary(input: formInputManager)
                
                let weeklySalary = salaryvm.calculateWeeklySalary(input: formInputManager)
                
                let hourlySalary = salaryvm.calculateHourlySalary(input: formInputManager)
                
                
                let tax = taxCalculator.calculate(salary: salaryValue)
                let ni = niCalculator.calculate(salary: salaryValue)
                let studentLoan = studentLoanCalulator.calculate(salary: salaryValue,studentLoanPlan: StudentLoanPlan(rawValue: formInput.studentLoan ) ?? StudentLoanPlan.planOne)
                
                let sheetViewController = SalaryBreakDownViewController(salaryBreakdown: SalaryBreakdown(monthlySalary: monthlySalary, dailySalary: dailySalary, hourlySalary: hourlySalary, weeklySalary: weeklySalary, tax: tax, ni: ni, studentLoan: studentLoan, originalSalary: salaryValue))
                
                navigationController?.pushViewController(sheetViewController, animated: true)
                
            } catch let formError {
                switch formError {
                case FormError.salaryContainsEmptyString:
                    showAlert(title: FormError.salaryContainsEmptyString.errorTitle ?? "", message: FormError.salaryContainsEmptyString.errorDescription, actionTitle: "Ok")
                case FormError.salaryFormContainsLetters:
                    showAlert(title: FormError.salaryFormContainsLetters.errorTitle ?? "", message: FormError.salaryFormContainsLetters.errorDescription, actionTitle: "Ok")
                case FormError.pensionContainsEmptyString:
                    showAlert(title: FormError.pensionContainsEmptyString.errorTitle ?? "", message: FormError.pensionContainsEmptyString.errorDescription, actionTitle: "Ok")
                case FormError.pensionFormContainsLetters:
                    showAlert(title: FormError.pensionFormContainsLetters.errorTitle ?? "", message: FormError.pensionFormContainsLetters.errorDescription, actionTitle: "Ok")
                case FormError.salaryIsBelowMin:
                    showAlert(title: FormError.salaryIsBelowMin.errorTitle ?? "", message: FormError.salaryIsBelowMin.errorDescription, actionTitle: "Ok")
                    
                default:
                    print("Unknown error")
                }
            }
            
        default:
            break
        }
    }
}
