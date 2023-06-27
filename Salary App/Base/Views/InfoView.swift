//
//  SalaryInfoView.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 24/06/2023.
//

import UIKit

class InfoView: UIView {
    
    private lazy var salaryDescriptionStackView: UIStackView = {
        let salaryDescriptionView = UIStackView()
        salaryDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        salaryDescriptionView.axis = .vertical
        salaryDescriptionView.alignment = .fill
        return salaryDescriptionView
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
    
    private var infoTitle: String = ""
    private var infoDescription: String = ""

    init(infoTitle: String,
         infoDescription: String) {
        self.infoTitle = infoTitle
        self.infoDescription = infoDescription
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

private extension InfoView {
    
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        
        salaryTitleLbl.text = infoTitle
        salaryDescriptionLbl.text = infoDescription
        
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
