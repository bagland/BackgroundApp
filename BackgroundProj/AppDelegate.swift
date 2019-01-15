//
//  AppDelegate.swift
//  BackgroundProj
//
//  Created by Baglan Daribayev on 2019-01-13.
//  Copyright © 2019 Daribayev. All rights reserved.
//

import UIKit

enum MyError: Error {
    case unknown
    case api
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var count: Int = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        application.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
        return true
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

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        fetchRequest(successCompletion: { [unowned self] (json) in
            self.count += 1
            DispatchQueue.main.async {
                if let ctrl = UIApplication.shared.keyWindow?.rootViewController as? ViewController {
                    ctrl.setCount(self.count)
                }
            }
            completionHandler(.newData)
        }) { (error) in
            completionHandler(.failed)
        }
    }
    
    private func fetchRequest(successCompletion: @escaping (([String: Any]) -> Void),
                              failureCompletion: @escaping ((Error) -> Void)) {
        let endpoint = "https://jsonplaceholder.typicode.com/users/1"
        guard let url = URL(string: endpoint) else {
            failureCompletion(MyError.unknown)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data
                else {
                    failureCompletion(MyError.api)
                    return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    else {
                        failureCompletion(MyError.api)
                        return
                }
                successCompletion(json)
            } catch {
                failureCompletion(MyError.api)
            }
        }.resume()
    }

}

