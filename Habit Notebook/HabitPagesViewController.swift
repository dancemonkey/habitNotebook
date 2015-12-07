//
//  HabitPagesViewController.swift
//  Habit Notebook
//
//  Created by Drew Lanning on 11/21/15.
//  Copyright © 2015 Drew Lanning. All rights reserved.
//

protocol SaveDataDelegate {
  func saveData()
  func addNewPage(forHabit habit: Habit)
}

import UIKit

class HabitPagesViewController: UIPageViewController, UIPageViewControllerDataSource, SaveDataDelegate {
  
  var data = [Habit]()
  let dataModel = DataModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    data = dataModel.getStoredData()
    
    dataSource = self
    if data.count > 0 {
      let startingControllers = [getItemController(0)!]
      setViewControllers(startingControllers, direction: .Forward, animated: false, completion: nil)
    } else if data.count == 0 {
      // LOAD "GET STARTED" PAGE
      // WRITE "GETBLANKCONTROLLER" PAGE
    }
    setAppearance()
  }
  
  override func viewDidAppear(animated: Bool) {
    let startingControllers = [getItemController(0)!]
    setViewControllers(startingControllers, direction: .Forward, animated: false, completion: nil)
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
  }
  
  func setAppearance() {
    let appearance = UIPageControl.appearance()
    appearance.backgroundColor = UIColor(red: 255/255, green: 140/255, blue: 0.0, alpha: 1.0)
    appearance.pageIndicatorTintColor = UIColor(red: 155/255, green: 77/255, blue: 0.0, alpha: 1.0)
  }
  
  func getItemController(fromDataIndex: Int) -> HabitViewController? {
    if data.count >= fromDataIndex {
      let newController = storyboard?.instantiateViewControllerWithIdentifier("HabitController") as! HabitViewController
      newController.habit = data[fromDataIndex]
      newController.setItemIndex(fromDataIndex)
      newController.saveDelegate = self
      navigationController?.navigationBar.tintColor = UIColor(red: 155/255, green: 77/255, blue: 0.0, alpha: 1.0)
      addNewItemBarButton()
      return newController
    }
    return nil
  }
  
  func addNewItemBarButton() {
    let button = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addNewHabit")
    navigationItem.rightBarButtonItem = button
  }
  
  func addNewHabit() {
    let addHabitVC = storyboard?.instantiateViewControllerWithIdentifier("AddNew") as! AddNewHabitViewController
    addHabitVC.saveDelegate = self
    navigationController?.pushViewController(addHabitVC, animated: true)
  }
  
  func addNewPage(forHabit habit: Habit) {
    data.append(habit)
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
    if itemController.getItemIndex()+1 < data.count {
      return getItemController(itemController.getItemIndex()+1)
    }
    return nil
  }
  
  func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    return data.count
  }
  
  func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    return 0
  }
  
  func saveData() {
    dataModel.saveThis(data: data)
  }
  
  // DEBUG METHOD
  func printDataContents() {
    for item in data {
      print(item.getHistory())
    }
  }
}
