//
//  ViewController.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/17/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

// this will also need to record the data back to the PageVC so that it remains up to date.
// right now when swiping back and forth it's fetching new blank data each time

import UIKit

class HabitViewController: UIViewController {
  
  var habit: Habit!
  var datasource: Habit!
  let now = NSDate()
  private var itemIndex: Int!
  
  @IBOutlet weak var habitName: UILabel!
  @IBOutlet weak var habitInfo: UILabel!
  var total: Int! {
    didSet {
      habitInfo.text = "\(now)" + "\n" + "\(habit.unitName!) - \(total)"
    }
  }
  @IBAction func performedHabit(sender: UIButton) {
    habit.addToDailyTotal(habit.unitTotal!)
    total = habit.getTotalForToday()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    
    self.habit = Habit(name: datasource.name, unitName: datasource.unitName, unitTotal: datasource.unitTotal)
    
    habitName.text = habit.name
    total = habit.getTotalForToday()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setItemIndex(toIndex: Int) {
    itemIndex = toIndex
  }
  
  func getItemIndex() -> Int {
    return itemIndex
  }

}

