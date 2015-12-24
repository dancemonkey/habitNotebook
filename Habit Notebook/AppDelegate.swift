//
//  AppDelegate.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/17/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let defaults = NSUserDefaults.standardUserDefaults()
  var launchTime: NSDate!

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    
    return true
  }
  
  func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    let priorLaunch = getPriorLaunchDate()
    let currentLaunch = saveCurrentLaunchDate()
    
    guard priorLaunch != nil else {
      return true
    }
    
    if priorLaunch < currentLaunch {
      let model = DataModel()
      let data = model.getStoredData()
      if data.count > 0 {
        for habit in data {
          print(habit.getTotalForToday(), priorLaunch!)
          habit.save(todayToHistory: habit.getTotalForToday(), forDate: priorLaunch!)
        }
        model.saveThis(data: data)
      }
    } else if priorLaunch == currentLaunch {
    }
    
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  func getPriorLaunchDate() -> String? {
    guard let priorLaunch = defaults.objectForKey("lastLaunch") else {
      return nil
    }
    return priorLaunch as? String
  }

  func saveCurrentLaunchDate() -> String {
    launchTime = NSDate()
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = .ShortStyle
    dateFormatter.timeStyle = .NoStyle
    let justLaunchDate = dateFormatter.stringFromDate(launchTime)
    defaults.setObject(justLaunchDate, forKey: "lastLaunch")
    return justLaunchDate
  }

}

