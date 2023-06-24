//
//  SalaryInfoView.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 24/06/2023.
//

import UIKit

class SalaryInfoView: UIView {
    
    private lazy var salaryDescriptionStackView: UIStackView = {
        let salaryDescriptionView = UIStackView()
        salaryDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        salaryDescriptionView.axis = .vertical
        salaryDescriptionView.alignment = .fill
//        salaryDescriptionView.distribution = .equalSpacing
        return salaryDescriptionView
    }()
    
    private lazy var salaryDescriptionLbl: UILabel = {
        let salaryDescription = UILabel()
        salaryDescription.translatesAutoresizingMaskIntoConstraints = false
        salaryDescription.textColor = UIColor.darkGray
        salaryDescription.text = "A fixed regular payment, typically paid on a monthly basis but often expressed as an annual sum, made by an employer to an employee, especially a professional or white-collar worker."
        salaryDescription.numberOfLines = 0
        salaryDescription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return salaryDescription
    }()
    
    private lazy var salaryTitleLbl: UILabel = {
        let salaryTitle = UILabel()
        salaryTitle.translatesAutoresizingMaskIntoConstraints = false
        salaryTitle.textColor = .black
        salaryTitle.text = "What is a salary"
//        salaryTitle.numberOfLines = 0
        salaryTitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return salaryTitle
    }()
    

    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

private extension SalaryInfoView {
    
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.addSubview(salaryDescriptionStackView)
        salaryDescriptionStackView.addArrangedSubview(salaryTitleLbl)
        salaryDescriptionStackView.addArrangedSubview(salaryDescriptionLbl)
        
        NSLayoutConstraint.activate([
        
            self.salaryDescriptionStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.salaryDescriptionStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            self.salaryDescriptionStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.salaryDescriptionStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
    }
}
