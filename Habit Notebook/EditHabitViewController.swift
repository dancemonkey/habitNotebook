//
//  EditHabitViewController.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 12/21/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

import UIKit

class EditHabitViewController: UIViewController {

  @IBOutlet weak var habitName: UITextField!
  @IBOutlet weak var habitUnitName: UITextField!
  @IBAction func doneEditing(sender: UIButton) {
    if habitName.text != "" && habitUnitName.text != "" {
      habit?.name = habitName.text!
      habit?.unitName = habitUnitName.text
      saveDelegate.saveData()
      navigationController?.popViewControllerAnimated(true)
    }
  }
  
  var habit: Habit?
  var saveDelegate: SaveDataDelegate!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      habitName.text = habit?.name
      habitUnitName.text = habit?.unitName
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func viewWillAppear(animated: Bool) {
    
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
