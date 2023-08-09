//
//  AppDelegate.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        startAppCoordinator()
        return true
    }
    
    func startAppCoordinator() {
        guard let appCoordinator = returnResolver().resolve(AppCoordinator.self) else { return }
        appCoordinator.start()
    }
}

extension AppDelegate: AssemblerResolverDelegate {
    
}

