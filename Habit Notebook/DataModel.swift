//
//  DataModel.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/25/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

import Foundation

class DataModel {
  private var storage = [Habit]()
  let defaults = NSUserDefaults.standardUserDefaults()
  
  init() {
    
    if let _ = defaults.objectForKey("StoredData") {
      let storedData = defaults.objectForKey("StoredData") as! NSData
      storage = NSKeyedUnarchiver.unarchiveObjectWithData(storedData) as! [Habit]
    } else {
      // FAKE TEST DATA SO WE HAVE PAGES TO TURN IN THE INTERFACE, UNTIL I SET UP A WAY TO ADD CUSTOM DATA
      storage.append(Habit(name: "Track New Habit", unitName: "Units", unitTotal: nil))
    }
  }
  
  
  func getStoredData() -> [Habit] {
    return storage
  }
  
  func saveThis(data data: [Habit]) {
    let archive = NSKeyedArchiver.archivedDataWithRootObject(data)
    defaults.setObject(archive, forKey: "StoredData")
  }
}