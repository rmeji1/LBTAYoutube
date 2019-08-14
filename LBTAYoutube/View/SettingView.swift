//
//  SettingView.swift
//  LBTAYoutube
//
//  Created by Rob on 6/12/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class SettingView: UIView, SettingProtocol {
  let cellId = "Cell"
  weak var delegate: MoreViewProtocol?
  
  lazy var delegateDatasource = SettingCollectionViewDataSourceDelagate(cellId: cellId, delegate: self)
  
  let collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: SettingLayout())
    return collectionView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    collectionView.register(SettingCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.dataSource = delegateDatasource
    collectionView.delegate = delegateDatasource
    addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.fill(in: self)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func push(_ viewController: UIViewController) {
    delegate?.push(viewController)
  }
  
  func dismiss() {
    delegate?.dismiss()
  }
}


