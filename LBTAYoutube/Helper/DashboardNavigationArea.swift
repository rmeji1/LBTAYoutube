//
//  DashboardNavigationArea.swift
//  LBTAYoutube
//
//  Created by Rob on 6/12/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class DashboardNavigationArea {
  let collectionView: UICollectionView
  let view: UIView
  let navigationController: UINavigationController
  let navigationItem: UINavigationItem
  let menuBarHeight: CGFloat = 50.0
  
  lazy var titleView: UILabel = {[unowned self] in
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
    return label
  }()
  
  weak var delegate: ViewController?

  init(collectionView: UICollectionView, view: UIView, navigationController: UINavigationController!, navigationItem: UINavigationItem, delegate: ViewController?) {
    self.collectionView = collectionView
    self.view = view
    self.navigationController = navigationController
    self.navigationItem = navigationItem
    self.delegate = delegate
  }
  
  lazy var menuBar : MenuBar = {[weak self] in
    let menuBar = MenuBar()
    menuBar.backgroundColor = .red
    menuBar.delegate = self?.delegate
    return menuBar
  }()
  
  let redView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  func createNavigationArea(){
    navigationController.navigationBar.isTranslucent = false
    navigationController.hidesBarsOnSwipe = true
    createAndSetNavigationItemTitleView()
    view.addSubview(redView)
    view.addSubview(menuBar)
    customizeRedView()
    customizeMenuBarToSubView()
    rightNavigationItems()
  }
  
  fileprivate func createAndSetNavigationItemTitleView() {
    titleView.text = "Home"
    titleView.font = UIFont.preferredFont(forTextStyle: .title3)
    titleView.textColor = .white
    navigationItem.titleView = titleView
  }
  
  fileprivate func customizeMenuBarToSubView() {
    menuBar.translatesAutoresizingMaskIntoConstraints = false
    menuBar.horizontally(equalTo: view, isInsafeArea: false)
    menuBar.height(equalTo: menuBarHeight)
    let viewTopAnchor = view.topAnchor
    menuBar.top(equalTo: viewTopAnchor)
  }
  
  fileprivate func customizeRedView(){
    redView.horizontally(equalTo: view, isInsafeArea: false)
    redView.height(equalTo: menuBar.heightAnchor)
    redView.leading(equalTo: view.leadingAnchor)
    redView.top(equalTo: view.topAnchor)
  }
  
  fileprivate func rightNavigationItems() {
    let searchItemImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
    let moreItemImage = UIImage(named: "nav_more_icon")?.withRenderingMode(.alwaysOriginal)
    let searchItem = UIBarButtonItem(image: searchItemImage , style: UIBarButtonItem.Style.plain, target: delegate  , action: #selector(delegate?.handleSearch))
    let moreItem = UIBarButtonItem(image: moreItemImage, style: .done, target: delegate, action: #selector(delegate?.handleMore))
    navigationItem.rightBarButtonItems = [moreItem, searchItem]
  }
  
}
