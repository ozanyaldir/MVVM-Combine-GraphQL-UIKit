//
//  AppDelegate.swift
//  home-task-ios
//
//  Created by Sebastiano catellani on 17.05.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window?.rootViewController = FeedViewController()
        self.window?.makeKeyAndVisible()

        return true
    }
}
