//
//  SceneDelegate.swift
//  Salary App
//
//  Created by Tobi Adegoroye on 09/06/2023.
//

import UIKit


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene{
            
            let window = UIWindow(windowScene: windowScene)
            let formVC = SalaryFormViewController()
            let navigation = UINavigationController(rootViewController: formVC)
            window.rootViewController = navigation
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

