//
//  AppDelegate.swift
//  TestWorkRostov
//
//  Created by Artem Chuklov on 16.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let mainVC = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainVC)
        
        MainAssembly.configure(with: mainVC)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

