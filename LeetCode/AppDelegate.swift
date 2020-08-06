//
//  AppDelegate.swift
//  LeetCode
//
//  Created by Tim Ho on 2019/1/29.
//  Copyright © 2019年 Tim Ho. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let q = Q37.init()
        
//        [
//        ["6",".","3","1",".",".","2",".","."],
//        [".",".",".",".","4",".",".",".","7"],
//        [".","2",".",".",".","8","9",".","."],
//        [".",".",".",".","5",".",".",".","."],
//        [".",".",".",".",".",".",".","4","."],
//        ["2","5",".",".",".",".",".",".","1"],
//        [".",".",".","6",".",".",".",".","."],
//        ["5","9","8",".","3",".",".",".","2"],
//        [".",".","4","2",".",".",".","3","."]]
        
        var info: [[Character]] = [
            ["6",".","3","1",".",".","2",".","."],
            [".",".",".",".","4",".",".",".","7"],
            [".","2",".",".",".","8","9",".","."],
            [".",".",".",".","5",".",".",".","."],
            [".",".",".",".",".",".",".","4","."],
            ["2","5",".",".",".",".",".",".","1"],
            [".",".",".","6",".",".",".",".","."],
            ["5","9","8",".","3",".",".",".","2"],
            [".",".","4","2",".",".",".","3","."]]
        
        q.solveSudoku(&info)
        
        let q2 = Q36.init()
        let result = q2.isValidSudoku(info)
//        
        print("result: \(result)")
        
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


}

