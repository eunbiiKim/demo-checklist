//
//  AppDelegate.swift
//  Checklist
//
//  Created by 김은비 on 19/11/2019.
//  Copyright © 2019 eunbiiKim. All rights reserved.
//

import UIKit
import os.log

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        os_log("didFinishLaunchingWithOptions", log: OSLog.default, type: .info)
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        os_log("configurationForConnecting", log: OSLog.default, type: .info)
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//        let sceneDelegate = SceneDelegate()
//        sceneDelegate.saveData()
        
        os_log("didDiscardSceneSessions", log: OSLog.default, type: .info)
    }
    
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        saveData()
//        print("applicationDidEnterBackground")
//    }
//
//    func applicationWillTerminate(_ application: UIApplication) {
//        saveData()
//        print("applicationWillTerminate")
//    }
    

    
    
}

