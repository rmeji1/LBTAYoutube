//
//  SettingCollectionViewCell.swift
//  LBTAYoutube
//
//  Created by Rob on 6/12/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class SettingCollectionViewCell: UICollectionViewCell {
  override var isHighlighted: Bool{
    didSet{
      cellHighighted(isHighlighted)
    }
  }
  
  var setting: Setting?{
    didSet{
      nameLabel.text = setting?.name
      imageView.image = UIImage(named: setting?.imageName ?? "")?.withRenderingMode(.alwaysTemplate)
      imageView.tintColor = .darkGray
    }
  }
  
  let nameLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  let imageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    addAllSubviews()
    setNameLabelConstraints()
    setImageViewConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func cellHighighted(_ isHighlighted: Bool){
    if isHighlighted{
      setColors(backgroundColor: .darkGray, textColor: .white, tintColor: .white)
    }else{
      setColors(backgroundColor: .white, textColor: .black, tintColor: .darkGray)
    }
  }
  
  private func setColors(backgroundColor: UIColor, textColor: UIColor, tintColor: UIColor!){
    self.backgroundColor = backgroundColor
    nameLabel.textColor = textColor
    imageView.tintColor = tintColor
  }
  
  private func addAllSubviews(){
    [nameLabel, imageView].forEach { (view) in
      view.translatesAutoresizingMaskIntoConstraints = false
      addSubview(view)
    }
  }
  
  private func setNameLabelConstraints(){
    nameLabel.leading(equalTo: imageView.trailingAnchor, constant: 8)
    nameLabel.trailing(equalTo: trailingAnchor, constant: 16)
    nameLabel.top(equalTo: topAnchor)
    nameLabel.bottom(equalTo: bottomAnchor)
  }
  
  private func setImageViewConstraints(){
    imageView.height(equalTo: 30)
    imageView.width(equalTo: imageView.heightAnchor)
    imageView.leading(equalTo: leadingAnchor, constant: 16)
    imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
}
