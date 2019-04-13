//
//  AppDelegate.swift
//  circleprogressbar
//
//  Created by André Martingo on 13/04/2019.
//  Copyright © 2019 André Martingo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
