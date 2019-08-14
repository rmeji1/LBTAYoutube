//
//  DashboardFlowLayout.swift
//  LBTAYoutube
//
//  Created by Rob on 6/5/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class DashboardVideoFlowLayout: UICollectionViewFlowLayout {
  override func prepare() {
    super.prepare()
    
    guard let collectionView = collectionView else { return }
    setItemSize(for: collectionView)
    minimumLineSpacing = 0
//    headerReferenceSize = .init(width: collectionView.frame.width, height: 52)
  }
  
  private func setItemSize(for collectionView: UICollectionView ){
    let width = collectionView.frame.size.width
    let height: CGFloat = (width - 16) * 9 / 16
    itemSize = CGSize(width: width , height: height + 96)
  }
}
