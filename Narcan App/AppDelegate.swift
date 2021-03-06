//
//  AppDelegate.swift
//  Narcan App
//
//  Created by Chris Argonish on 10/18/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit
import UserNotifications
import ServiceCore
import ServiceCases
import ServiceKnowledge
import SalesforceKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static let apiManager = NarcanAPIManager.sharedInstance
    static let defaultManager = NarcanDefaultsManager.sharedInstance
    
    let registerationKey = "onRegisterCompleted"
    let messageKey = "onMessageReceived"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

//////////Commented out due to errors//////////////////////////////////////////////////
//        SCServiceCloud.sharedInstance().knowledge.isEnabled = true
//        SCServiceCloud.sharedInstance().cases.isEnabled = true
//        SCServiceCloud.sharedInstance().cases.caseCreateActionName = "NewNarcanRequest"
//        
//        // Create configuration object with init params
        let config = SCSServiceConfiguration(
            community: URL(string: "https://getperqs-developer-edition.na16.force.com/naloxone")!)
//            dataCategoryGroup: "Example",
//            rootDataCategory: "Example")

        
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor(red:0.16, green:0.29, blue:0.50, alpha:1.00)
        navigationBarAppearace.barTintColor = UIColor(red:0.16, green:0.29, blue:0.50, alpha:1.00)
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        // Override point for customization after application launch.
        
        //Push Notification
        SFPushNotificationManager.sharedInstance().registerForRemoteNotifications()
        
//        let center = UNUserNotificationCenter.current()
//        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
//            // actions based on whether notifications were authorized or not
//        }
//        application.registerForRemoteNotifications()
        
        return true
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        NSLog("Failed to get token, error: \(error.localizedDescription)")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        
        let nc = NotificationCenter.default
        nc.post(name: NSNotification.Name(rawValue: messageKey), object: nil, userInfo: userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        let nc = NotificationCenter.default
        nc.post(name: NSNotification.Name(rawValue: messageKey), object: nil, userInfo: userInfo)
        
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print(deviceTokenString)
        
        SFPushNotificationManager.sharedInstance().didRegisterForRemoteNotifications(withDeviceToken: deviceToken)
        
        SFPushNotificationManager.sharedInstance().registerForSalesforceNotifications()
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

