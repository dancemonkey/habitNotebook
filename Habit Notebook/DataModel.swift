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
  
  // search defaults to see if this already exists
  // if not, create new array to be populated by user
  // if so, load and dispatch userdefaults data to requesting page
  // add singleton to only dispatch once
  
  init() {
    
    // FAKE TEST DATA SO WE HAVE PAGES TO TURN IN THE INTERFACE
    storage.append(Habit(name: "H1", unitName: "Quarts", unitTotal: 5))
    storage.append(Habit(name: "H2", unitName: "Smokes", unitTotal: 1))
    storage.append(Habit(name: "H3", unitName: "Laps", unitTotal: 1))
    
  }
  
  func getStoredData() -> [Habit] {
    // first test for already existing data, load that into "storage", then... 
    return storage
  }
}