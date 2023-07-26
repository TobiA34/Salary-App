//
//  SalaryBreakDownViewController.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.
 

import UIKit

class SalaryBreakDownViewController: UIViewController {
        
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var monthlyStackView: SalaryHorizontalStackView = {
        let stackView = SalaryHorizontalStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var salaryMonthlyLbl: UILabel = {
        let salaryMonthlyLbl = UILabel()
        salaryMonthlyLbl.translatesAutoresizingMaskIntoConstraints = false
        return salaryMonthlyLbl
    }()
    
    private lazy var yearlyStackView: SalaryHorizontalStackView = {
        let stackView = SalaryHorizontalStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var salaryYearlyLbl: UILabel = {
        let salaryYearlyLbl = UILabel()
        salaryYearlyLbl.translatesAutoresizingMaskIntoConstraints = false
        return salaryYearlyLbl
    }()
    
    private lazy var dailyStackView: SalaryHorizontalStackView = {
        let stackView = SalaryHorizontalStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var salaryDailyLbl: UILabel = {
        let salaryDailyLbl = UILabel()
        salaryDailyLbl.translatesAutoresizingMaskIntoConstraints = false
        return salaryDailyLbl
    }()
    
    private lazy var weeklyStackView: SalaryHorizontalStackView = {
        let stackView = SalaryHorizontalStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var salaryWeeklyLbl: UILabel = {
        let salaryDailyLbl = UILabel()
        salaryDailyLbl.translatesAutoresizingMaskIntoConstraints = false
        return salaryDailyLbl
    }()
    
    
    private lazy var hourlyStackView: SalaryHorizontalStackView = {
        let stackView = SalaryHorizontalStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var salaryHourlyLbl: UILabel = {
        let salaryHourlyLbl = UILabel()
        salaryHourlyLbl.translatesAutoresizingMaskIntoConstraints = false
        return salaryHourlyLbl
    }()
    
    
    private lazy var taxStackView: SalaryHorizontalStackView = {
        let stackView = SalaryHorizontalStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var taxLbl: UILabel = {
        let taxLbl = UILabel()
        taxLbl.translatesAutoresizingMaskIntoConstraints = false
        return taxLbl
    }()

    
    private lazy var niStackView: SalaryHorizontalStackView = {
        let stackView = SalaryHorizontalStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var niLbl: UILabel = {
        let niLbl = UILabel()
        niLbl.translatesAutoresizingMaskIntoConstraints = false
        return niLbl
    }()
    
    private lazy var studentLoanStackView: SalaryHorizontalStackView = {
        let stackView = SalaryHorizontalStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var studentLoanLbl: UILabel = {
        let studentLoanLbl = UILabel()
        studentLoanLbl.translatesAutoresizingMaskIntoConstraints = false
        return studentLoanLbl
    }()
    
    
    private lazy var infoBtn: UIButton = {
        let infoBtn = UIButton()
        infoBtn.translatesAutoresizingMaskIntoConstraints = false
        infoBtn.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        return infoBtn
    }()
    
    private lazy var originalStackView: SalaryHorizontalStackView = {
        let stackView = SalaryHorizontalStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var originalSalaryLbl: UILabel = {
        let originalSalaryLbl = UILabel()
        originalSalaryLbl.translatesAutoresizingMaskIntoConstraints = false
        return originalSalaryLbl
    }()
    
    
    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.currencyCode = Locale.current.language.region?.identifier
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_GB")
        return formatter
    }()

    
    private lazy var salaryInfoVw: SalaryInfoView = {
        let salaryInfoVw = SalaryInfoView()
        return salaryInfoVw
    }()
    
    private let salaryBreakdown: SalaryBreakdown
    
    init(salaryBreakdown: SalaryBreakdown) {
        self.salaryBreakdown = salaryBreakdown
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func openLink() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension SalaryBreakDownViewController {
    
    func setup() {
        view.backgroundColor = UIColor(named: "darkMode")
        title = "My Salary Breakdown"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(stackView)
        
        
        stackView.addArrangedSubview(originalStackView)
        originalStackView.addArrangedSubview(originalSalaryLbl)

        stackView.addArrangedSubview(monthlyStackView)
        monthlyStackView.addArrangedSubview(salaryMonthlyLbl)

        stackView.addArrangedSubview(dailyStackView)
        dailyStackView.addArrangedSubview(salaryDailyLbl)
        
        
        stackView.addArrangedSubview(hourlyStackView)
        hourlyStackView.addArrangedSubview(salaryHourlyLbl)
        
        stackView.addArrangedSubview(weeklyStackView)
        weeklyStackView.addArrangedSubview(salaryWeeklyLbl)
        
        stackView.addArrangedSubview(taxStackView)
        taxStackView.addArrangedSubview(taxLbl)
        
        stackView.addArrangedSubview(niStackView)
        niStackView.addArrangedSubview(niLbl)
        
        stackView.addArrangedSubview(studentLoanStackView)
        studentLoanStackView.addArrangedSubview(studentLoanLbl)
        
        stackView.addArrangedSubview(salaryInfoVw)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            
        ])
        
        guard let formattedSalary =  numberFormatter.string(for: salaryBreakdown.originalSalary) else {return}
        guard let formattedMonthly =  numberFormatter.string(for: salaryBreakdown.monthlySalary) else {return}
        guard let formattedHourly =  numberFormatter.string(for: salaryBreakdown.hourlySalary) else {return}
        guard let formattedWeekly =  numberFormatter.string(for: salaryBreakdown.weeklySalary) else {return}
        guard let formattedTax =  numberFormatter.string(for: salaryBreakdown.tax) else {return}
        guard let formattedSalaryDaily =  numberFormatter.string(for: salaryBreakdown.dailySalary) else {return}
        guard let formattedNI =  numberFormatter.string(for: salaryBreakdown.ni) else {return}
        guard let formattedStudentLoan =  numberFormatter.string(for: salaryBreakdown.studentLoan) else {return}

        originalSalaryLbl.text = "Orignial salary: \(String(describing: formattedSalary))"
        salaryMonthlyLbl.text = "Monthly Total: \(String(describing: formattedMonthly))"
        salaryHourlyLbl.text = "Hourly Total: \(String(describing: formattedHourly))"
        salaryWeeklyLbl.text = "Weekly Total: \(String(describing: formattedWeekly))"
        taxLbl.text = "Tax: \(String(describing: formattedTax))"
        salaryDailyLbl.text = "Daily Total: \(String(describing: formattedSalaryDaily))"
        niLbl.text = "National Insurance: \(String(describing: formattedNI))"
        studentLoanLbl.text = "Student Loan: \(String(describing: formattedStudentLoan))"
  
    }
    
}
