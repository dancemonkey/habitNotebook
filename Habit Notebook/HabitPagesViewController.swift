//
//  HabitPagesViewController.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/21/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

// this will load an instance of each habitVC with each swipe.
// initialize in its viewDidLoad at top of program, load first content VC and init data

import UIKit

class HabitPagesViewController: UIPageViewController, UIPageViewControllerDataSource {
  
  var testSourceArray = [Habit]()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      // FAKE TEST DATA SO WE HAVE PAGES TO TURN IN THE INTERFACE
      testSourceArray.append(Habit(name: "H1", unitName: "Quarts", unitTotal: 5))
      testSourceArray.append(Habit(name: "H2", unitName: "Smokes", unitTotal: 1))
      testSourceArray.append(Habit(name: "H3", unitName: "Laps", unitTotal: 1))
      
      dataSource = self
      if testSourceArray.count > 0 {
        let firstController = self.storyboard?.instantiateViewControllerWithIdentifier("HabitController") as! HabitViewController
        firstController.datasource = testSourceArray[0]
        firstController.setItemIndex(0)
        let startingControllers = [firstController]
        setViewControllers(startingControllers, direction: .Forward, animated: false, completion: nil)
      }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func getItemController(fromDataIndex: Int) -> HabitViewController? {
    if testSourceArray.count >= fromDataIndex {
      let newController = storyboard?.instantiateViewControllerWithIdentifier("HabitController") as! HabitViewController
      newController.datasource = testSourceArray[fromDataIndex]
      newController.setItemIndex(fromDataIndex)
      return newController
    }
    return nil
  }
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
    let itemController = viewController as! HabitViewController
    if itemController.getItemIndex() > 0 {
      return getItemController(itemController.getItemIndex()-1)
    }
    return nil
  }
  
  
  func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
    let itemController = viewController as! HabitViewController
    if itemController.getItemIndex()+1 < testSourceArray.count {
      return getItemController(itemController.getItemIndex()+1)
    }
    return nil
  }
  
  func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    return testSourceArray.count
  }
  
  func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    return 0
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
