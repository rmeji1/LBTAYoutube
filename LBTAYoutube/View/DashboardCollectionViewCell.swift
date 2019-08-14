//
//  DashboardCollectionViewCell.swift
//  LBTAYoutube
//
//  Created by Rob on 6/5/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

let cache = NSCache<NSString, UIImage>()

class DashboardCollectionViewCell: UICollectionViewCell {
  
  var video: Video? {
    didSet{
      guard let video = video else {
        return
      }
      videoPreviewImageView.image = UIImage.from(urlString: video.thumbnailImageName)
      userThumbnailView.image = UIImage.from(urlString: video.channel.profileImageName)
      titleView.text = video.title
      let numberFormatter = NumberFormatter()
      numberFormatter.numberStyle = .decimal
      videoDescriptionView.text = "\(video.channel.name) • \(numberFormatter.string(from: NSNumber(value: video.numberOfViews))!) • 2 years ago "
      
    }
  }
  
  let videoPreviewImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = #imageLiteral(resourceName: "taylor_swift_blank_space")
    return imageView
  }()
  
  let userThumbnailView : UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .green
    imageView.image = #imageLiteral(resourceName: "taylor_swift_profile")
    imageView.layer.cornerRadius = 22
    imageView.layer.masksToBounds = true
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  let titleView: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.text = "Taylor Swift - Blank Space"
    label.font = UIFont.preferredFont(forTextStyle: .body)
    return label
  }()
  
  let videoDescriptionView: UILabel = {
    let label = UILabel()
    label.text = "TaylorSwiftVEVO • 1,604,684,607 views • 2 years ago"
    label.font = UIFont.preferredFont(forTextStyle: .caption2)
    label.numberOfLines = 0
    return label
  }()
  
  let seperatorView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    addAllSubviews()
    
    videoPreviewImageView.horizontally(equalTo: self)
    videoPreviewImageView.top(equalTo: layoutMarginsGuide.topAnchor)
    videoPreviewImageView.bottom(equalTo: userThumbnailView.topAnchor, constant: -8)
    
    userThumbnailView.width(equalTo: 44)
    userThumbnailView.height(equalTo: userThumbnailView.widthAnchor)
    userThumbnailView.bottom(equalTo: seperatorView.topAnchor, constant: -24)
    userThumbnailView.leading(equalTo: layoutMarginsGuide.leadingAnchor)
    
    titleView.top(equalTo: userThumbnailView.topAnchor)
    titleView.leading(equalTo: userThumbnailView.trailingAnchor, constant: 8)
    titleView.trailing(equalTo: videoPreviewImageView.trailingAnchor)
    
    videoDescriptionView.top(equalTo: titleView.bottomAnchor, constant: 8)
    videoDescriptionView.horizontally(equalTo: titleView, isInsafeArea: false)
    
    seperatorView.horizontally(equalTo: self)
    seperatorView.height(equalTo: 1)
    seperatorView.bottom(equalTo: bottomAnchor)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func addAllSubviews(){
    [videoPreviewImageView, userThumbnailView, titleView, videoDescriptionView, seperatorView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
  }
  
}
