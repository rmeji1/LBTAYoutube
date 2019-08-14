//
//  MenuBarLayout.swift
//  LBTAYoutube
//
//  Created by Rob on 6/7/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class MenuBarLayout: UICollectionViewFlowLayout {

  override func prepare() {
    super.prepare()
    guard let collectionView = collectionView else {
      return
    }
    setItemSize(in: collectionView)
    minimumLineSpacing = 0
  }
  
  private func setItemSize(in collectionView: UICollectionView){
    let width = collectionView.frame.width / 4
    let height = collectionView.frame.height
    itemSize = CGSize(width: width, height: height)
    minimumInteritemSpacing = 0
  }
}
