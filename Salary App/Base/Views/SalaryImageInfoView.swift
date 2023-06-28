//
//  SalaryImageInfoView.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 27/06/2023.
//

import UIKit

class SalaryImageInfoView: UIView{
    
    private lazy var salaryDescriptionMainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var salaryDescriptionHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var salaryDescriptionVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
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
    
    private lazy var salaryImageView: UIImageView = {
        let salaryImageView = UIImageView()
        salaryImageView.translatesAutoresizingMaskIntoConstraints = false
        salaryImageView.contentMode = .scaleAspectFit
        return salaryImageView
    }()
    
    private var salary: Salary!

    
    init(salary: Salary) {
        self.salary = salary
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

 
private extension SalaryImageInfoView {
    
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        
        salaryTitleLbl.text = salary.title
        salaryDescriptionLbl.text = salary.description
        salaryImageView.image = UIImage(named: salary.image)
        
        self.addSubview(salaryDescriptionMainStackView)
        
        self.salaryDescriptionMainStackView.addArrangedSubview(salaryDescriptionHorizontalStackView)
        self.salaryDescriptionMainStackView.addArrangedSubview(salaryDescriptionVerticalStackView)
        
        salaryDescriptionHorizontalStackView.addArrangedSubview(salaryImageView)
        salaryDescriptionVerticalStackView.addArrangedSubview(salaryTitleLbl)
        salaryDescriptionVerticalStackView.addArrangedSubview(salaryDescriptionLbl)

        NSLayoutConstraint.activate([
        
            self.salaryDescriptionMainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.salaryDescriptionMainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            self.salaryDescriptionMainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.salaryDescriptionMainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            salaryImageView.heightAnchor.constraint(equalToConstant: 60),
            salaryImageView.widthAnchor.constraint(equalToConstant: 60)

        ])
    }
}
