//
//  ViewControllerViewCustomizer.swift
//  LBTAYoutube
//
//  Created by Rob on 6/19/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit


struct ViewControllerViewCustomizer{
  weak var viewController: ViewController?
  
  func customize(){
    viewController?.view.backgroundColor = .white
    setupNavigationArea()
    setupMoreView()
    customizeCollectionView()
  }
  
  private func setupNavigationArea(){
    guard let viewController = viewController else { return }
    viewController.navArea = DashboardNavigationArea(collectionView: viewController.collectionView,
                                                     view: viewController.view,
                                                     navigationController: viewController.navigationController!,
                                                     navigationItem: viewController.navigationItem,
                                                     delegate: viewController)
    viewController.navArea?.createNavigationArea()
  }
  
  private func customizeCollectionView() {
    guard let collectionView = viewController?.collectionView,
      let navArea = viewController?.navArea,
      let view = viewController?.view else {
        return
    }
    collectionView.backgroundColor = .white
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.top(equalTo: navArea.menuBar.bottomAnchor)
    collectionView.horizontally(equalTo: view, isInsafeArea: false)
    collectionView.bottom(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    collectionView.isPagingEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
  }
  
  private func setupMoreView() {
    guard let moreView = viewController?.moreView else { return }
    if let window = UIApplication.shared.keyWindow{
      window.addSubview(moreView)
      moreView.translatesAutoresizingMaskIntoConstraints = false
      moreView.fill(in: window)
      moreView.setIsHidden(true, animated: false)
    }
  }
}
