//
//  ViewController.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/17/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

// include double-tap to edit items on habit screen
// get rid of status bar in IB and have buttons show in pageVC status bar

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
  @IBAction func addNewHabit(sender: UIBarButtonItem) {
  }
  
  // LABELS
  @IBOutlet weak var habitInfo: UILabel!
  var total: Int! {
    didSet {
      habitInfo.text = "\(getCurrentFormattedDate())" + "\n \n" + "\(habit.unitName!) - \(total)"
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
  
  func getCurrentFormattedDate() -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = .FullStyle
    dateFormatter.timeStyle = .NoStyle
    return dateFormatter.stringFromDate(now)
  }
  
  func editLabel(withText text: String, forLabel label: UILabel) {
    let newTextBox = UITextField()
    newTextBox.text = text
    newTextBox.frame = label.frame
    newTextBox.textAlignment = label.textAlignment
    newTextBox.font = label.font
    newTextBox.userInteractionEnabled = true
    view.addSubview(newTextBox)
    print("\(label.frame) " + "\(newTextBox.frame)")
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    if segue.identifier == "showProgress" {
      let destVC = segue.destinationViewController as! ProgressTableViewController
      destVC.data = self.habit
    }
  }
}

