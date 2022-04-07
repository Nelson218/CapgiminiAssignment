//
//  AppDelegate.swift
//  Capgimini
//
//  Created by Nelson Thomas Pereira on 07/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var listCoOrdinator: MovieCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let movieCoordinator = MovieCoordinator()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = movieCoordinator.rootViewController
        
        return true
    }

}

