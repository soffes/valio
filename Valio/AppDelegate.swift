//
//  AppDelegate.swift
//  Valio
//
//  Created by Sam Soffes on 6/5/14.
//  Copyright (c) 2014 Sam Soffes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
	lazy var window: UIWindow? = {
		let win = UIWindow(frame: UIScreen.mainScreen().bounds)
		win.backgroundColor = UIColor.whiteColor()
		win.rootViewController = UINavigationController(rootViewController: ScheduleTableViewController())
		return win
	}()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        window!.makeKeyAndVisible()
        return true
    }
}
