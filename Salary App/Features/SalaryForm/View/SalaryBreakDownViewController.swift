//
//  SalaryBreakDownViewController.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 12/07/2023.


import UIKit

class SalaryBreakDownViewController: UIViewController {
    
    private let salaryBreakdown: SalaryBreakdown

    private lazy var salaryBreakDownAccordionView: AccordionView = {
        let salaryBreakDownAccordionView = AccordionView(salaryBreakdown: salaryBreakdown)
        salaryBreakDownAccordionView.translatesAutoresizingMaskIntoConstraints = false
        return salaryBreakDownAccordionView
    }()
    
 
    init(salaryBreakdown: SalaryBreakdown) {
        self.salaryBreakdown = salaryBreakdown
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        view.addSubview(salaryBreakDownAccordionView)

        NSLayoutConstraint.activate([
            salaryBreakDownAccordionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            salaryBreakDownAccordionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            salaryBreakDownAccordionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            salaryBreakDownAccordionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
