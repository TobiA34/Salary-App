//
//  ViewController.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 09/06/2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var salaryTextField: UITextField!
    
    @IBOutlet weak var salarySC: UISegmentedControl!
    
    @IBOutlet weak var monthlySalaryLbl: UILabel!
    @IBOutlet weak var weeklySalaryLbl: UILabel!
    // create variable monthly, days, weekly
    
    @IBOutlet weak var dailySalaryLbl: UILabel!
    
    //Annual salary ÷ 52 = weekly rate
    // (Annual salary ÷ 52)÷ 7.5 = Hourly rate
    //Annual salary ÷ 12 = Monthly rate
    
    var monthlySalary: Int?
    var weeklySalary: Int?
    var dailySalary: Int?
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        salaryTextField.keyboardType = .asciiCapableNumberPad
        salaryTextField.delegate = self
        setDoneOnKeyboard()
    }
    
    func setDoneOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.salaryTextField.inputAccessoryView = keyboardToolbar
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func presentError() {
        
        if salaryTextField.text == "" {
            let alert = UIAlertController(title: "Salary", message: "You need to enter yearly", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }

    
    
    @IBAction func submitBtnPressed(_ sender: Any) {
        
        presentError()
        
        switch salarySC.selectedSegmentIndex {
        case 0:
            let salary = Int(self.salaryTextField.text!) ?? 0
            monthlySalary =  salary / 12
            
            let formattedMonthlySalary = " £\(String(monthlySalary ?? 0))"
            
            if salary != 0 {
                monthlySalaryLbl.text = "This is your monthly salary:\(formattedMonthlySalary)"
            }
            break
            
        case 1:
            let salary = Int(self.salaryTextField.text!) ?? 0
            dailySalary =  (salary / 52) / Int(7.5)
            let formattedHourlySalary = " £\(String(dailySalary ?? 0))"
            
            if salary != 0 {
                dailySalaryLbl.text = "This is your daily salary:\(formattedHourlySalary)"
            }
            break
            
        case 2:
            let salary = Int(self.salaryTextField.text!) ?? 0
            weeklySalary =  (salary / 52)
            defaults.set(weeklySalary, forKey: "weekly")
            
            let formattedWeeklySalary = " £\(String(weeklySalary ?? 0))"
            if salary != 0 {
                weeklySalaryLbl.text = "This is your weekly salary:\(formattedWeeklySalary)"
            }

            break
            
        default:
            break
        }
    }
    
}


