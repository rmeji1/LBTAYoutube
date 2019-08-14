//
//  SettingLayout.swift
//  LBTAYoutube
//
//  Created by Rob on 6/12/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class SettingLayout: UICollectionViewFlowLayout{
  override func prepare() {
    super.prepare()
    
    guard let collectionView = collectionView else {
      return
    }
    
    setItemSize(in: collectionView)
    minimumLineSpacing = 0
  }
  
  private func setItemSize(in collectionView: UICollectionView){
    let width = collectionView.frame.width
    let height: CGFloat = 50
    itemSize = CGSize(width: width, height: height)
  }
}
