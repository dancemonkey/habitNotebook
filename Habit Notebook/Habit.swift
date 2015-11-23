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

class Habit {
  var name: String
  var unitName: String?
  var unitTotal: Int?
  private var dailyTotal = 0
  private var history = [[NSDate: Int]]()
  
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
  
  // THIS SHOULD BE CALLED ONCE PER DAY FOR ALL HABITS IF THE LAST TIME THE APP OPENED WAS BEFORE MIDNIGHT
  // SHOULD ALSO SAVE TO COREDATA OR SETTINGS WHENEVER THE APP OPENS OR CLOSES (PUT IN ANOTHER FUNCTION)
  func save(todayToHistory currentTotal: Int, forDate date: NSDate) {
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
  
  func getTotalFor(date searchDate: NSDate) -> Int? {
    for entry in history {
      for (date,total) in entry {
        if date.isEqualToDate(searchDate) {
          return total
        }
      }
    }
    return nil
  }
}