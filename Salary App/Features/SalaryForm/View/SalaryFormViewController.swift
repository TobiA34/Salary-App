//
//  FormViewController.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
//

import UIKit
import SafariServices

class SalaryFormViewController: UIViewController {
    
    let studentLoanPlans = [StudentLoanPlan.planOne.rawValue,
                StudentLoanPlan.planTwo.rawValue,
                StudentLoanPlan.planFour.rawValue,
                StudentLoanPlan.planFive.rawValue,
                StudentLoanPlan.postgraduateLoan.rawValue
    ]
    
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
        textField.keyboardType = .asciiCapableNumberPad
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.text = studentLoanPlans[0]
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
         return textField
    }()
    
    let pickerView = UIPickerView()
    
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
    private let pensionCalculator = PensionContributionCalculator()
    private let studentLoanPlan = StudentLoanPlan.planOne
    
    let salaryvm: SalaryFormViewModel!
    private let salaryTypeTextField = UITextField()
    
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
                // MARK: Calculation
                
                @objc func calculateSalary() {
                    let salaryValue = Double(salaryTextField.text ?? "") ?? 0
                    let pensionValue = Double(pensionTextField.text ?? "") ?? 0
                    do {
                        
                        try validationManager.isValid(input: FormInput(text: salaryTextField.text ?? "", number: salaryValue))

 
                        let monthlySalary =  salaryvm.calculateMonthlySalary(salaryForm: SalaryForm(salary: salaryValue, pensionContributions: pensionValue))
                        
                        let dailySalary =  salaryvm.calculateDailySalary(salaryForm:SalaryForm(salary: salaryValue, pensionContributions: pensionValue))
                        
                        let weeklySalary = salaryvm.calculateWeeklySalary(salaryForm: SalaryForm(salary: salaryValue, pensionContributions: pensionValue))
                        
                        let hourlySalary = salaryvm.calculateHourlySalary(salaryForm: SalaryForm(salary: salaryValue, pensionContributions: pensionValue))
                        
                        
                        let tax = taxCalculator.calculate(salary: salaryValue)
                        let ni = niCalculator.calculate(salary: salaryValue)
                        let studentLoan = studentLoanCalulator.calculate(salary: salaryValue,studentLoanPlan: StudentLoanPlan(rawValue: studentLoanTextField.text ?? "" ) ?? StudentLoanPlan.planOne)
                        
                        let sheetViewController = SalaryBreakDownViewController(salaryBreakdown: SalaryBreakdown(monthlySalary: monthlySalary, dailySalary: dailySalary, hourlySalary: hourlySalary, weeklySalary: weeklySalary, tax: tax, ni: ni, studentLoan: studentLoan, originalSalary: salaryValue))
                        
                        navigationController?.pushViewController(sheetViewController, animated: true)
                        
                    } catch let formError {
                        switch formError {
                        case FormError.containsEmptyString:
                            showAlert(title: FormError.containsEmptyString.errorTitle ?? "", message: FormError.containsEmptyString.errorLocalDescription, actionTitle: "Ok")
                        case FormError.formContainsLetters:
                            showAlert(title:  FormError.formContainsLetters.errorTitle ?? "", message: FormError.formContainsLetters.errorLocalDescription, actionTitle: "Ok")
                        default:
                            print("Error")
                        }
                    }

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
                    self.studentLoanTextField.inputAccessoryView = keyboardToolbar
                    self.pensionTextField.inputAccessoryView = keyboardToolbar
                    self.taxCodeTextField.inputAccessoryView = keyboardToolbar

                    salaryTypeTextField.layer.borderColor = UIColor.black.cgColor
                    salaryTypeTextField.layer.borderWidth = 1
                    salaryTypeTextField.layer.cornerRadius = 16
                    
                    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
                    salaryTextField.leftView = paddingView
                    
                    salaryTextField.leftViewMode = .always
                    
                     pickerView.delegate = self
                    studentLoanTextField.inputView = pickerView
                    
                    
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
                    
                    stackView.addArrangedSubview(studentLoanStackView)
                    studentLoanStackView.addArrangedSubview(studentLoanLbl)
                    studentLoanStackView.addArrangedSubview(studentLoanTextField)
                    
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
                        studentLoanTextField.heightAnchor.constraint(equalToConstant: 44),

                    ])
                }
            }
 

extension SalaryFormViewController: UIPickerViewDelegate, UIPickerViewDataSource  {
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

