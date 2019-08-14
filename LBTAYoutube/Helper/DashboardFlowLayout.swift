//
//  DashboardFlowLayout.swift
//  LBTAYoutube
//
//  Created by Rob on 6/18/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class DashboardFlowLayout: UICollectionViewFlowLayout {
  override func prepare() {
    super.prepare()
    scrollDirection = .horizontal
    guard let collectionView = collectionView else { return }
    setItemSize(for: collectionView)
    minimumLineSpacing = 0
    collectionView.bounces = false
  }
  
  private func setItemSize(for collectionView: UICollectionView ){
    let width = collectionView.bounds.width
    let height = collectionView.bounds.height
    itemSize = CGSize(width: width , height: height)
  }
}
