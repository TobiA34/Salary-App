//
//  AccordionView.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 27/07/2023.
//

import UIKit


class AccordionView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = false
        return scrollView
    }()
    
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    private lazy var iconButton: UIButton = {
        let iconButton = UIButton()
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        iconButton.setTitle("Closed ▲", for: .normal)
        iconButton.setTitleColor(.black, for: .normal)
        iconButton.addTarget(self, action: #selector(touchHappen), for: .touchUpInside)
        iconButton.tintColor = .black
        return iconButton
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 32
        return stackView
    }()
    
    private lazy var mainstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 32
        stackView.layer.cornerRadius = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 48, right: 16)
        stackView.backgroundColor = .white
        return stackView
    }()
    
    
    private lazy var monthlyStackView: SalaryHorizontalStackView = {
        let stackView = SalaryHorizontalStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var salaryMonthlyLbl: UILabel = {
        let salaryMonthlyLbl = UILabel()
        salaryMonthlyLbl.textColor = .black
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
        salaryYearlyLbl.textColor = .black
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
        salaryDailyLbl.textColor = .black
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
        salaryDailyLbl.textColor = .black
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
        salaryHourlyLbl.textColor = .black
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
        taxLbl.textColor = .black
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
        niLbl.textColor = .black
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
        studentLoanLbl.textColor = .black
        studentLoanLbl.translatesAutoresizingMaskIntoConstraints = false
        return studentLoanLbl
    }()
    
  
    
    private lazy var originalStackView: SalaryHorizontalStackView = {
        let stackView = SalaryHorizontalStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var originalSalaryLbl: UILabel = {
        let originalSalaryLbl = UILabel()
        originalSalaryLbl.textColor = .black
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
    
    private let salaryBreakdown: SalaryBreakdown
    private var shouldCollapse = false
    var myViewHeightConstraint : NSLayoutConstraint!

    init(salaryBreakdown: SalaryBreakdown) {
        self.salaryBreakdown = salaryBreakdown
        super.init(frame: .zero)
        setup()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showIcon() {
        if shouldCollapse {
            self.iconButton.setTitle("Closed ▲", for: .normal)
            shouldCollapse = false
        } else {
            self.iconButton.setTitle("Open ▼", for: .normal)
            shouldCollapse = true
        }
    }
    
    @objc func touchHappen() {
        UIView.animate(withDuration: 0.7) {
            self.myViewHeightConstraint.constant = -self.scrollView.frame.size.height + 180
            self.layoutIfNeeded()
            self.showIcon()
        }
    }
 
}

extension AccordionView {
    
    func setup() {
        self.addSubview(scrollView)
        scrollView.addSubview(mainstackView)
        mainstackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(iconButton)
        mainstackView.addArrangedSubview(stackView)

        
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
        
        
         self.myViewHeightConstraint = scrollView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor)

        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),

            self.myViewHeightConstraint,
            
            mainstackView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 20),
            mainstackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainstackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainstackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -20),

            mainstackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

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
