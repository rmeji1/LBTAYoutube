//
//  MenuBar.swift
//  LBTAYoutube
//
//  Created by Rob on 6/7/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class MenuBar: UIView {
  let cellId = "Cell"
  let imageNames = ["home", "trending", "subscriptions", "account"]
  weak var delegate: ViewControllerProtocol?
  
  lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: MenuBarLayout())
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .red
    return collectionView
  }()
  
  let underlineSelectedView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  var underlineSelectedViewLeadingConstraint: NSLayoutConstraint?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.fill(in: self)
    
    let indexPath = IndexPath(item: 0, section: 0)
    collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
    
    addSubview(underlineSelectedView)
    underlineSelectedView.height(equalTo: 5)
    underlineSelectedView.bottom(equalTo: bottomAnchor)
    underlineSelectedViewLeadingConstraint = underlineSelectedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
    underlineSelectedViewLeadingConstraint?.isActive = true
    underlineSelectedView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/4).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension MenuBar: UICollectionViewDelegate, UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCollectionViewCell
    cell.imageTitle = imageNames[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.scrollToMenuItem(at: indexPath.item)
    delegate?.updateTitleView(with: indexPath.item)
  }
  
  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    underlineSelectedView.isHidden = true
  }
  
  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    underlineSelectedView.isHidden = false

  }
  
  fileprivate func underlineSelected(width: CGFloat, at indexPath: IndexPath?){
    guard let indexPath = indexPath else { return }
    self.layoutIfNeeded()
    UIView.animate(withDuration: 0.25) {
      self.underlineSelectedViewLeadingConstraint?.constant = (width * CGFloat(indexPath.item))
      self.layoutIfNeeded()
    }
    
  }
}
