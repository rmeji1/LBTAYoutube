//
//  DashboardNavigationAreaTwo.swift
//  LBTAYoutube
//
//  Created by Rob on 6/19/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class DashboardNavigationArea: NSObject{
  let collectionView: UICollectionView
  let view: UIView
  let navigationController: UINavigationController
  let navigationItem: UINavigationItem
  let delegate: ViewController?
  
  lazy var menuBar: MenuBar = { [unowned self] in
    let view = MenuBar()
    view.delegate = self.delegate
    return view
  }()
  
  lazy var titleView: UILabel = {
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
    label.font = UIFont.preferredFont(forTextStyle: .title2)
    label.text = "Home"
    label.textColor = .white
    return label
  }()
  
  init (collectionView: UICollectionView,
        view: UIView,
        navigationController: UINavigationController,
        navigationItem: UINavigationItem,
        delegate: ViewController?){
    
    self.collectionView = collectionView
    self.view = view
    self.navigationController = navigationController
    self.navigationItem = navigationItem
    self.delegate = delegate
  }
  
  func createNavigationArea(){
    navigationItem.titleView = titleView
    navigationController.navigationBar.isTranslucent = false
    setupMenuBar()
    setupRightBarButtonItems()
  }
  
  fileprivate func setupMenuBar(){
    view.addSubview(menuBar)
    menuBar.translatesAutoresizingMaskIntoConstraints = false
    menuBar.height(equalTo: 50)
    menuBar.width(equalTo: view.widthAnchor)
    menuBar.top(equalTo: view.safeAreaLayoutGuide.topAnchor)
    menuBar.leading(equalTo: view.leadingAnchor)
  }
  
  fileprivate func setupRightBarButtonItems(){
    let moreImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysTemplate)
    let moreItem = UIBarButtonItem(image: moreImage, style: .plain, target: delegate, action: #selector(delegate?.handleMore))
    moreItem.tintColor = .white
    
    let search = UIImage(named: "search_icon")
    let searchItem = UIBarButtonItem(image: search, style: .plain, target: nil, action: nil)
    searchItem.tintColor = .white

    navigationItem.rightBarButtonItems = [moreItem, searchItem]
  }
}




