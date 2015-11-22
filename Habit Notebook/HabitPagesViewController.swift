//
//  HabitPagesViewController.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/21/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

// this will load an instance of each habitVC with each swipe.
// This will also be its own datasource delegate, must have the two convenience functions
// initialize in its viewDidLoad at top of program, load first content VC and init data

import UIKit

class HabitPagesViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
