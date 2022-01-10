//
//  AppDelegate.swift
//  Quantrics
//
//  Created by Excell Nicolas on 1/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = DashboardViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

