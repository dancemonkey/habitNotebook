//
//  DataModel.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/25/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

import Foundation

class DataModel {
  var storage = [Habit]()
  
  // search defaults to see if this already exists
  // if not, create new array to be populated by user
  // if so, load and dispatch userdefaults data to requesting page
  // add singleton to only dispatch once
}