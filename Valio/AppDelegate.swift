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
                            
	var window: UIWindow?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
		window = UIWindow(frame: UIScreen.mainScreen().bounds)
		window!.backgroundColor = UIColor.whiteColor()
		window!.rootViewController = UINavigationController(rootViewController: ScheduleTableViewController(nibName: nil, bundle: nil))
		window!.makeKeyAndVisible()
		return true
	}
}
