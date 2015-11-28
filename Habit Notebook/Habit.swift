//
//  Habit.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/22/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

import Foundation

enum HabitFrequency {
  case Daily
  case Weekly
  case Monthly
  case Custom
}

class Habit: NSObject, NSCoding {
  var name: String
  var unitName: String?
  var unitTotal: Int?
  private var dailyTotal = 0
  private var history = [[String: Int]]()
  
  init(name: String, unitName: String?, unitTotal: Int?) {
    self.name = name
    if let uName = unitName {
      self.unitName = uName
    } else {
      self.unitName = "Times"
    }
    if let uTotal = unitTotal {
      self.unitTotal = uTotal
    } else {
      self.unitTotal = 1
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObjectForKey("name") as! String
    self.unitName = aDecoder.decodeObjectForKey("unitName") as! String!
    self.unitTotal = aDecoder.decodeObjectForKey("unitTotal") as! Int!
    self.dailyTotal = aDecoder.decodeObjectForKey("dailyTotal") as! Int
    self.history = aDecoder.decodeObjectForKey("history") as! [[String:Int]]
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.name, forKey: "name")
    aCoder.encodeObject(self.unitName, forKey: "unitName")
    aCoder.encodeObject(self.unitTotal, forKey: "unitTotal")
    aCoder.encodeObject(self.dailyTotal, forKey: "dailyTotal")
    aCoder.encodeObject(self.history, forKey: "history")
  }
  
  // THIS SHOULD BE CALLED ONCE PER DAY FOR ALL HABITS IF THE LAST TIME THE APP OPENED WAS BEFORE MIDNIGHT
  // SHOULD ALSO SAVE TO COREDATA OR SETTINGS WHENEVER THE APP OPENS OR CLOSES (PUT IN ANOTHER FUNCTION)
  func save(todayToHistory currentTotal: Int, forDate date: String) {
    history.append([date: currentTotal])
    clearDailyTotal()
  }
  
  private func clearDailyTotal() {
    dailyTotal = 0
  }
  
  func addToDailyTotal(this: Int) {
    self.dailyTotal += this
  }
  
  func getTotalForToday() -> Int {
    return dailyTotal
  }
  
  func getTotalFor(date searchDate: String) -> Int? {
    for entry in history {
      for (date,total) in entry {
        if date == searchDate {
          return total
        }
      }
    }
    return nil
  }
}