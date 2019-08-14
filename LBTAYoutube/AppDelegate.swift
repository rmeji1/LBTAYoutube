//
//  AppDelegate.swift
//  LBTAYoutube
//
//  Created by Rob on 6/5/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()

    let layout = DashboardFlowLayout()
    let collectionView = ViewController(collectionViewLayout: layout)
    let navigationController = DashboardNavigationViewController(rootViewController: collectionView)
    window?.rootViewController = navigationController

    guard let window = window else { return  true }
    let statusBarView = UIView()
    statusBarView.backgroundColor = .init(red: 194/255, green: 31/255, blue: 31/255, alpha: 1.0)
    window.addSubview(statusBarView)
    statusBarView.translatesAutoresizingMaskIntoConstraints = false
    statusBarView.leadingAnchor.constraint(equalTo: window.leadingAnchor)
    statusBarView.heightAnchor.constraint(equalToConstant: application.statusBarFrame.height).isActive = true
    statusBarView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
    statusBarView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
    statusBarView.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive  = true
    return true
  }
}

