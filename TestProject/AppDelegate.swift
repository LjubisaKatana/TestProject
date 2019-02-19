//
//  AppDelegate.swift
//  TestProject
//
//  Created by Ljubisa Katana on 2/14/19.
//  Copyright © 2019 Ljubisa Katana. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

//    var isLogged: Bool {
//        return UserDefaults.standard.string(forKey: "token") != nil
//    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureRootViewController()
        
        return true
    }
}

private extension AppDelegate {
    func configureRootViewController() {
        let vc = UINavigationController(rootViewController: SetupController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
//        window?.rootViewController = SetupController()
        window?.makeKeyAndVisible()
    }
}

extension AppDelegate {
    func changeRootViewController() {
        let vc = UINavigationController(rootViewController: PropertyController())
        window?.rootViewController = vc
    }
}
