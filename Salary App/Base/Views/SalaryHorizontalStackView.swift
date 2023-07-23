//
//  SalaryStackViews.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 17/07/2023.
//

import UIKit

class SalaryHorizontalStackView: UIStackView {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 24
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension SalaryHorizontalStackView {
    
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)

        NSLayoutConstraint.activate([
        
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
}
