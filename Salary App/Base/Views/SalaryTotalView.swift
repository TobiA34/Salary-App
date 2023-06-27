//
//  SalaryTotalView.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 24/06/2023.
//

import UIKit

protocol SalaryTotalViewDelegate: AnyObject {
    func didTapInfo(type: SalaryType)
}

class SalaryTotalView: UIView {
    
    private lazy var salaryTotalLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SF Pro Rounded", size: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var infoBtn: UIButton = {
        let infoBtn = UIButton()
        infoBtn.translatesAutoresizingMaskIntoConstraints = false
        infoBtn.setImage(UIImage(systemName: "info.circle.fill"), for: .normal)
        infoBtn.addTarget(self, action: #selector(didTapInfo), for: .touchUpInside)
        return infoBtn
    }()
    
    private var salaryImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "salaryIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.currencyCode = Locale.current.language.region?.identifier
        formatter.numberStyle = .currency
        return formatter
    }()
    
    private var type: SalaryType
    weak var delegate: SalaryTotalViewDelegate?
    
    init(type: SalaryType) {
        self.type = type
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        self.type = .daily
        super.init(coder: coder)
        
    }
    
    func update(total: Double) {
        let salary =  numberFormatter.string(for: total) ?? "-"
        salaryTotalLbl.text = "\(type.title) Total: \(salary)"
    }
    
    @objc func didTapInfo() {
        delegate?.didTapInfo(type: type)
    }
}


private extension SalaryTotalView {
    
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        
  
        let defaultSalary =  numberFormatter.string(for: 0) ?? "-"

        salaryTotalLbl.text = "\(type.title) Total: \(defaultSalary)"
        
        self.addSubview(stackView)
        stackView.addArrangedSubview(salaryImageView)
        stackView.addArrangedSubview(salaryTotalLbl)
        stackView.addArrangedSubview(infoBtn)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            infoBtn.heightAnchor.constraint(equalToConstant: 44),
            infoBtn.widthAnchor.constraint(equalToConstant: 44),
            
            salaryImageView.heightAnchor.constraint(equalToConstant: 50),
            salaryImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
        
    }
}
