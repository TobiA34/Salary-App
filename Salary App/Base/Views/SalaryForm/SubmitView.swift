//
//  ButtonComponent.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 28/07/2023.
//

import UIKit

class SubmitView: UIView {
    
    weak var delegate: ButtonViewDelegate?
    private var id: String
    
    private lazy var calculateBtn: UIButton = {
        let calculateBtn = UIButton()
        calculateBtn.translatesAutoresizingMaskIntoConstraints = false
        calculateBtn.backgroundColor = .systemBlue
        calculateBtn.setTitle("Submit", for: .normal)
        calculateBtn.layer.cornerRadius = 16
        calculateBtn.addTarget(self, action: #selector(calculateSalary), for: .touchUpInside)
        return calculateBtn
    }()
    
    @objc func calculateSalary() {
             delegate?.didCalculate(id: FormID.submit.rawValue)
     }
    
    
    init(id: String) {
        self.id = id
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension SubmitView {
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(calculateBtn)
        NSLayoutConstraint.activate([
            calculateBtn.topAnchor.constraint(equalTo: self.topAnchor),
            calculateBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            calculateBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            calculateBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            calculateBtn.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}


