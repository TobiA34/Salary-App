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

    private lazy var salaryPickerLbl: UILabel = {
        let SalaryPickerLbl = UILabel()
        SalaryPickerLbl.textColor = .black
        SalaryPickerLbl.text = "Enter Salary type"
        SalaryPickerLbl.translatesAutoresizingMaskIntoConstraints = false
        return SalaryPickerLbl
    }()
    
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
    
    private lazy var pensionStackView: UIStackView = {
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
    
    private lazy var workingHoursStackView: UIStackView = {
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
    
    private lazy var workingHoursLbl: UILabel = {
        let SalaryDescdLbl = UILabel()
        SalaryDescdLbl.textColor = .black
        SalaryDescdLbl.text = "Enter Working hours"
        SalaryDescdLbl.translatesAutoresizingMaskIntoConstraints = false
        return SalaryDescdLbl
    }()
    
    private lazy var workingHoursTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.textColor = .black
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.keyboardType = .asciiCapableNumberPad
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
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
        textField.keyboardType = .asciiCapableNumberPad
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var calculateBtn: UIButton = {
        let calculateBtn = UIButton()
        calculateBtn.translatesAutoresizingMaskIntoConstraints = false
        calculateBtn.backgroundColor = .systemBlue
        calculateBtn.setTitle("Submit", for: .normal)
        calculateBtn.layer.cornerRadius = 16
        calculateBtn.addTarget(self, action: #selector(calculateSalary), for: .touchUpInside)
        return calculateBtn
    }()
    
    
   private let validationManager = ValidationManager()
   private let taxCalculator = TaxCalculator()
   private let niCalculator = NICalaculator()
   private let studentLoanCalulator = StudentLoanCalculator()

     let salaryvm = SalaryFormViewModel(taxCalculator: TaxCalculator(), niCalculator: NICalaculator(), studentLoanCalculator: StudentLoanCalculator(), pensionContributionCalculator: PensionContributionCalculator())
   private let salaryTypeTextField = UITextField()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SalaryFormViewController {
    // MARK: Calculation
    
    @objc func calculateSalary() {
        let salaryValue = Double(salaryTextField.text ?? "") ?? 0
        let pensionValue = Double(pensionTextField.text ?? "") ?? 0
         do {
            try validationManager.isValid(texts: [salaryTextField.text ?? "" , pensionTextField.text ?? ""])
            try validationManager.inValidNumber(values: [pensionTextField.text  ?? "" , salaryTextField.text ?? ""])
            try validationManager.isValidSalary(number: salaryValue)
            try validationManager.isValidPenContribution(number: pensionValue)
             
             let monthlySalary =  salaryvm.calculateMonthlySalary(salaryForm: SalaryForm(salary: salaryValue, pensionContributions: pensionValue))
            
             let dailySalary =  salaryvm.calculateDailySalary(salaryForm:SalaryForm(salary: salaryValue, pensionContributions: pensionValue))
             
             let weeklySalary = salaryvm.calculateWeeklySalary(salaryForm: SalaryForm(salary: salaryValue, pensionContributions: pensionValue))
             
             let hourlySalary = salaryvm.calculateHourlySalary(salaryForm: SalaryForm(salary: salaryValue, pensionContributions: pensionValue))

          
            let tax = taxCalculator.calculate(salary: salaryValue)
            let ni = niCalculator.calculate(salary: salaryValue)
            let studentLoan = studentLoanCalulator.calculate(salary: salaryValue)

             let sheetViewController = SalaryBreakDownViewController(salaryBreakdown: SalaryBreakdown(monthlySalary: monthlySalary, dailySalary: dailySalary, hourlySalary: hourlySalary, weeklySalary: weeklySalary, tax: tax, ni: ni, studentLoan: studentLoan, originalSalary: salaryValue))
            
            navigationController?.pushViewController(sheetViewController, animated: true)
            
        } catch FormError.containsEmptyString {
            showAlert(title: "Error", message: FormError.containsEmptyString.errorLocalDescription, actionTitle: "Ok")
        } catch FormError.formContainsLetters {
            showAlert(title: "Error", message: FormError.formContainsLetters.errorLocalDescription, actionTitle: "Ok")
        }catch FormError.invalidSalary {
            showAlert(title: "Error", message: FormError.invalidSalary.errorLocalDescription, actionTitle: "Ok")
        } catch FormError.isValidPenContribution {
            showAlert(title: "Error", message: FormError.isValidPenContribution.errorLocalDescription, actionTitle: "Ok")
        }
        catch {
            print("Not known\(error) ")
        }
        
        
    }
}

extension UIViewController {
    func showAlert(title: String, message: String, actionTitle: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
        
        // This sets up the done button on keyboard
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.salaryTextField.inputAccessoryView = keyboardToolbar
        self.salaryTypeTextField.inputAccessoryView = keyboardToolbar
        
        salaryTypeTextField.layer.borderColor = UIColor.black.cgColor
        salaryTypeTextField.layer.borderWidth = 1
        salaryTypeTextField.layer.cornerRadius = 16
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        salaryTextField.leftView = paddingView

        salaryTextField.leftViewMode = .always
 
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(salaryTextFieldStackView)
        salaryTextFieldStackView.addArrangedSubview(salaryTextFieldLbl)
        salaryTextFieldStackView.addArrangedSubview(salaryTextField)
        
   
        stackView.addArrangedSubview(pensionStackView)
        pensionStackView.addArrangedSubview(pensionLbl)
        pensionStackView.addArrangedSubview(pensionTextField)
        
        stackView.addArrangedSubview(taxCodeStackView)
        taxCodeStackView.addArrangedSubview(taxCodeLbl)
        taxCodeStackView.addArrangedSubview(taxCodeTextField)
        
        stackView.addArrangedSubview(calculateBtn)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            salaryTextField.heightAnchor.constraint(equalToConstant: 44),
            calculateBtn.heightAnchor.constraint(equalToConstant: 44),
            salaryTypeTextField.heightAnchor.constraint(equalToConstant: 44),
            pensionTextField.heightAnchor.constraint(equalToConstant: 44),
            workingHoursTextField.heightAnchor.constraint(equalToConstant: 44),
            taxCodeTextField.heightAnchor.constraint(equalToConstant: 44),

        ])
    }
}
 
