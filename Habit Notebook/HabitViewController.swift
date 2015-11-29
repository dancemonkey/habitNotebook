//
//  ViewController.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/17/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

import UIKit

class HabitViewController: UIViewController {
  
  // PROPERTIES
  var habit: Habit!
  let now = NSDate()
  var saveDelegate: SaveDataDelegate!
  private var itemIndex: Int!
  
  // BOTTOM CONTROL BAR ITEMS
  @IBAction func showProgress(sender: UIBarButtonItem) {
    print("showing progress")
  }
  
  // LABELS
  @IBOutlet weak var habitName: UILabel!
  @IBOutlet weak var habitInfo: UILabel!
  var total: Int! {
    didSet {
      habitInfo.text = "\(getCurrentFormattedDate())" + "\n" + "\(habit.unitName!) - \(total)"
    }
  }
  
  // THE BIG MAIN BUTTON
  @IBAction func performedHabit(sender: UIButton) {
    habit.addToDailyTotal(habit.unitSize!)
    total = habit.getTotalForToday()
    saveDelegate.saveData()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
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
  
  func getCurrentFormattedDate() -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = .FullStyle
    dateFormatter.timeStyle = .NoStyle
    return dateFormatter.stringFromDate(now)
  }

}

