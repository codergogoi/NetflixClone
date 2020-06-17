//
//  AppDelegate.swift
//  Netflix_Clone
//
//  Created by JAYANTA GOGOI on 5/20/20.
//  Copyright © 2020 JAYANTA GOGOI. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let landingViewController = LandingViewController()
        
        let rootViewController = UINavigationController(rootViewController: landingViewController)
        window?.rootViewController = rootViewController
                
        return true
    }


}

