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
    
    private lazy var monthlyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        return stackView
    }()
    private lazy var salaryMonthlyLbl: UILabel = {
        let salaryMonthlyLbl = UILabel()
        salaryMonthlyLbl.translatesAutoresizingMaskIntoConstraints = false
        return salaryMonthlyLbl
    }()
    
    private lazy var yearlyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        return stackView
    }()
    private lazy var salaryYearlyLbl: UILabel = {
        let salaryYearlyLbl = UILabel()
        salaryYearlyLbl.translatesAutoresizingMaskIntoConstraints = false
        return salaryYearlyLbl
    }()
    
    private lazy var dailyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        return stackView
    }()
    private lazy var salaryDailyLbl: UILabel = {
        let salaryDailyLbl = UILabel()
        salaryDailyLbl.translatesAutoresizingMaskIntoConstraints = false
        return salaryDailyLbl
    }()
    
    private lazy var weeklyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        return stackView
    }()
    private lazy var salaryWeeklyLbl: UILabel = {
        let salaryDailyLbl = UILabel()
        salaryDailyLbl.translatesAutoresizingMaskIntoConstraints = false
        return salaryDailyLbl
    }()
    
    
    private lazy var hourlyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        return stackView
    }()
    private lazy var salaryHourlyLbl: UILabel = {
        let salaryHourlyLbl = UILabel()
        salaryHourlyLbl.translatesAutoresizingMaskIntoConstraints = false
        return salaryHourlyLbl
    }()
    
    
    private lazy var taxStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        return stackView
    }()
    private lazy var taxLbl: UILabel = {
        let taxLbl = UILabel()
        taxLbl.translatesAutoresizingMaskIntoConstraints = false
        return taxLbl
    }()

    
    private lazy var niStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        return stackView
    }()
    private lazy var niLbl: UILabel = {
        let niLbl = UILabel()
        niLbl.translatesAutoresizingMaskIntoConstraints = false
        return niLbl
    }()
    
    private lazy var studentLoanStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
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
    
    private lazy var originalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        return stackView
    }()
    private lazy var originalSalaryLbl: UILabel = {
        let originalSalaryLbl = UILabel()
        originalSalaryLbl.translatesAutoresizingMaskIntoConstraints = false
        return originalSalaryLbl
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
        
        originalSalaryLbl.text = "Orignial salary: £\(salaryBreakdown.originalSalary)"

        salaryMonthlyLbl.text = "Monthly Total: £\(salaryBreakdown.monthlySalary)"
        salaryHourlyLbl.text = "Hourly Total: £\(salaryBreakdown.hourlySalary)"
        salaryWeeklyLbl.text = "Weekly Total: £\(salaryBreakdown.weeklySalary)"
        taxLbl.text = "Tax: £\(salaryBreakdown.tax)"
        salaryDailyLbl.text = "Daily Total £\(salaryBreakdown.dailySalary)"
        niLbl.text = "National Insurance £\(salaryBreakdown.ni)"
        studentLoanLbl.text = "Student Loan £\(salaryBreakdown.studentLoan)"
        
//        originalSalaryLbl.text = "Orignial salary: £\(originalSalary)"
//
//        salaryMonthlyLbl.text = "Monthly Total: £\(monthlySalary)"
//        salaryHourlyLbl.text = "Hourly Total: £\(hourlySalary)"
//        salaryWeeklyLbl.text = "Weekly Total: £\(weeklySalary)"
//        taxLbl.text = "Tax: £\(tax)"
//        salaryDailyLbl.text = "Daily Total £\(dailySalary)"
//        niLbl.text = "National Insurance £\(ni)"
//        studentLoanLbl.text = "Student Loan £\(studentLoan)"

    }
    
}
