//
//  PageCollectionViewCell.swift
//  LBTAYoutube
//
//  Created by Rob on 6/18/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
  weak var viewController: DetailViewControllerProtocol?
  
  lazy var collectionView : UICollectionView = { [unowned self] in
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .white
    return collectionView
  }()
  
  var layout: UICollectionViewFlowLayout {
    return DashboardVideoFlowLayout()
  }
  
  var cellId: String{
    return "CellId"
  }

  typealias CellType = DashboardCollectionViewCell
  
  var videos: [Video]? {
    didSet{
      DispatchQueue.main.async {[weak self] in
        self?.collectionView.reloadData()
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    registerCell()
    load()
    collectionView.fill(in: self)
  }
  
  func load(){
    
  }
  
  func registerCell(){
    collectionView.register(CellType.self, forCellWithReuseIdentifier: cellId)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension PageCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return videos?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CellType
    cell.video = videos?[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    viewController?.show()
  }
}
