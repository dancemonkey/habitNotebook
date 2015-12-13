//
//  AddNewHabitViewController.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 12/5/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

// FIX THIS SO SEGUE UNWINDS BACK TO NEWLY CREATED PAGE
// ... or to previously left page if just cancelling without creating

import UIKit

class AddNewHabitViewController: UIViewController {

  var newHabit: Habit?
  var saveDelegate: SaveDataDelegate!
  var index = 0
  
  @IBOutlet weak var habitName: UITextField!
  @IBOutlet weak var habitUnitName: UITextField!
  @IBOutlet weak var goodOrBadHabit: UISwitch!
  @IBAction func addHabit(sender: UIButton) {
    if habitName.text != "" && habitUnitName.text != "" {
      saveDelegate.addNewPage(forHabit: Habit(name: habitName.text!, unitName: habitUnitName.text!, unitTotal: nil))
      saveDelegate.saveData()
      navigationController?.popViewControllerAnimated(true)
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    view.endEditing(true)
    super.touchesBegan(touches, withEvent: event)
  }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
