//
//  SalaryInfoView.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 24/06/2023.
//

import UIKit

class SalaryInfoView: UIView {
    
    private lazy var salaryDescriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        stackView.layer.cornerRadius = 16
        stackView.layer.borderWidth = 1
        return stackView
    }()
    
    private lazy var salaryDescriptionLbl: UILabel = {
        let salaryDescription = UILabel()
        salaryDescription.translatesAutoresizingMaskIntoConstraints = false
        salaryDescription.textColor = UIColor.darkGray
        salaryDescription.numberOfLines = 0
        salaryDescription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return salaryDescription
    }()
    
    private lazy var salaryTitleLbl: UILabel = {
        let salaryTitle = UILabel()
        salaryTitle.translatesAutoresizingMaskIntoConstraints = false
        salaryTitle.textColor = .black
        salaryTitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return salaryTitle
    }()
    
    private var title: String
    private var desc: String

    init(title: String, desc: String) {
        self.title = title
        self.desc = desc
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

        salaryTitleLbl.text = title
        salaryDescriptionLbl.text = desc
        
        NSLayoutConstraint.activate([
        
            self.salaryDescriptionStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.salaryDescriptionStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            self.salaryDescriptionStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.salaryDescriptionStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
    }
}
