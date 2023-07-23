//
//  UIViewController+Alert.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 17/07/2023.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, actionTitle: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
