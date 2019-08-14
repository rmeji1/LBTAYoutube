//
//  MenuCollectionViewCell.swift
//  LBTAYoutube
//
//  Created by Rob on 6/7/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
  private let defaultTintColor = UIColor(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
  
  var imageTitle: String?{
    didSet{
      imageView.image = UIImage(named: imageTitle!)?.withRenderingMode(.alwaysTemplate)
    }
  }

  
  lazy var imageView: UIImageView = {[unowned self] in
    let imageView = UIImageView()
    imageView.tintColor = self.defaultTintColor
    return imageView
    }()
  
  override var isSelected: Bool{
    didSet{
      imageView.tintColor = isSelected ? .white : defaultTintColor
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
    
    [imageView].forEach{
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    imageView.height(equalTo: 28)
    imageView.width(equalTo: imageView.heightAnchor)
    imageView.center(in: self)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
