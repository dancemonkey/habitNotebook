//
//  ViewController.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/17/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

// include double-tap to edit items on habit screen
// get rid of status bar in IB and have buttons show in pageVC status bar
// saveDelegate.removeItem(atIndex: self.itemIndex)
// EVENTUALLY USE THIS SOMEWHERE ELSE, IN A 'DELETE' BUTTON
// When deleting habit, if none are left, re-load "starter" habit

import UIKit

class HabitViewController: UIViewController {
  
  // PROPERTIES
  var habit: Habit!
  let now = NSDate()
  var saveDelegate: SaveDataDelegate!
  private var itemIndex: Int!
  
  // BOTTOM CONTROL BAR ITEMS
  @IBAction func showProgress(sender: UIBarButtonItem) {
  }
  @IBOutlet weak var showProgress: UIBarButtonItem!
  @IBAction func editHabit(sender: AnyObject) {
  }
  @IBOutlet weak var editHabit: UIBarButtonItem!
  
  // LABELS
  @IBOutlet weak var habitInfo: UILabel!
  var total: Int! {
    didSet {
      if !habitIsFirstHabit() {
        habitInfo.text = "\(getCurrentFormattedDate())" + "\n \n" + "\(habit.unitName!) - \(total)"
      } else if habitIsFirstHabit() {
        habitInfo.text = "\(habit.unitName!)"
      }
    }
  }
  
  // THE BIG MAIN BUTTON
  @IBOutlet weak var performedHabit: UIButton!
  @IBAction func performedHabit(sender: UIButton) {
    habit.addToDailyTotal(habit.unitSize!)
    total = habit.getTotalForToday()
    saveDelegate.saveData()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if habitIsFirstHabit() {
      disableControlsForFirstHabit()  
    }
  }
  
  override func viewDidAppear(animated: Bool) {
    parentViewController?.navigationItem.title = habit.name
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
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
  
  func disableControlsForFirstHabit() {
    showProgress.enabled = false
    performedHabit.enabled = false
    editHabit.enabled = false
  }
  
  func habitIsFirstHabit() -> Bool {
    return habit.name == "NO HABITS"
  }
  
  func getCurrentFormattedDate() -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = .FullStyle
    dateFormatter.timeStyle = .NoStyle
    return dateFormatter.stringFromDate(now)
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    if segue.identifier == "showProgress" {
      let destVC = segue.destinationViewController as! ProgressTableViewController
      destVC.data = self.habit
      destVC.index = self.itemIndex
    }
  }
}

