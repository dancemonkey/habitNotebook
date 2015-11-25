//
//  ViewController.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/17/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

// This must have a datasource variable that PageVC will set when it loads this instance.
// This must set that datasource to the propert view outlets in a ViewWillAppear method.
// So I will also need a data model to hold the data for each "habit"...
// ... and to construct an array of habits that will be called and loaded into the appropriate Content VC (this file)

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
    
    // TEST HABIT TO HOOK UP LABELS AND TEST MODEL HELPER FUNCTIONS
    // IN PRODUCTION THIS WILL POPULATE FROM datasource, WHICH WILL BE SET FROM THE PAGEVIEWCONTROLLER
    self.habit = Habit(name: "Nose Picking", unitName: "Picks", unitTotal: nil)
    
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

