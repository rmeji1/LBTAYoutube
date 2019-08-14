//
//  ViewController.swift
//  LBTAYoutube
//
//  Created by Rob on 6/5/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit


class ViewController: UICollectionViewController {
  var pageDatasource = PageDatasource()
  unowned var backgroundView: UIView! { return moreView.backgroundView }
  var moreViewBottomConstaint: NSLayoutConstraint?
  var navArea: DashboardNavigationArea?
  
  lazy var moreView: MoreView = { [weak self] in
    let view = MoreView()
    view.delegate = self
    return view
    }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setDatasourceAndRegisterCells()
    customizeView()
    let gesture = UITapGestureRecognizer(target: self, action: #selector(handleMore))
    backgroundView.addGestureRecognizer(gesture)
  }
  
  fileprivate func setDatasourceAndRegisterCells() {
    collectionView.dataSource = pageDatasource
    pageDatasource.viewController = self
    
    for page in pageDatasource.pages{
      collectionView.register(page.type, forCellWithReuseIdentifier: page.cellId)
    }
  }
  
  fileprivate func customizeView(){
    let customizer = ViewControllerViewCustomizer(viewController: self)
    customizer.customize()
  }
  
  @objc func handleMore(){
    moreView.isHidden ? moreView.setIsHidden(false) : moreView.setIsHidden(true)
  }
  
  @objc func handleSearch(){
    
  }
  
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let menuBar = navArea!.menuBar
    let offSet = scrollView.contentOffset.x / 4
    menuBar.underlineSelectedViewLeadingConstraint?.constant = offSet
  }
  
  override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let index = targetContentOffset.pointee.x / view.frame.width
    let indexPath = IndexPath(item: Int(index), section: 0)
    let menuBar = navArea!.menuBar
    menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    updateTitleView(with: Int(index))
  }
}

extension ViewController: ViewControllerProtocol, DetailViewControllerProtocol{
  func updateTitleView(with index: Int){
    navArea!.titleView.text = pageDatasource.getTitle(for: index)
  }
  
  func push(_ viewController: UIViewController) {
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  func scrollToMenuItem(at index: Int){
    let indexPath = IndexPath(item: index, section: 0)
    collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
  }
  
  func show() {
    let viewSafeArea = view.safeAreaLayoutGuide.layoutFrame
    let maxX = viewSafeArea.maxX - 200
    let maxY = viewSafeArea.maxY - 200
    let intialVideoViewFrame = CGRect(x: maxX, y: maxY, width: 200, height: 200)
    
    let detailViewController = DetailVideoViewController()
    addChild(detailViewController)
    detailViewController.view.frame = intialVideoViewFrame
    view.addSubview(detailViewController.view)
    navigationController?.setNavigationBarHidden(true, animated: false)
    detailViewController.didMove(toParent: self)
  }
}
