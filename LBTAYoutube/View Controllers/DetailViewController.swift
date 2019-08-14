//
//  DetailViewController.swift
//  LBTAYoutube
//
//  Created by Rob on 6/12/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  var setting: Setting?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.tintColor = .white
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white, .font: UIFont.preferredFont(forTextStyle: .title3)]
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    navigationController?.navigationBar.tintColor = nil
    navigationController?.navigationBar.titleTextAttributes = nil
  }
}
