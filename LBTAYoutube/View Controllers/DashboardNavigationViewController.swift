//
//  DashboardNavigationViewController.swift
//  LBTAYoutube
//
//  Created by Rob on 6/6/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class DashboardNavigationViewController: UINavigationController {
  override var preferredStatusBarStyle: UIStatusBarStyle{
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationBar.barTintColor = UIColor.red
    navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationBar.shadowImage = UIImage()
    hidesBarsOnSwipe = true
  }
}
