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

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

