//
//  VideoDetailView.swift
//  LBTAYoutube
//
//  Created by Rob on 6/29/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class VideoDetailView: UIView {
  var initalFrame: CGRect
  var endFrame: CGRect
  var videoPlayerHeightAnchor: NSLayoutConstraint?

  let videoPlayer : VideoPlayer = {
    let view = VideoPlayer()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  convenience init(initalFrame: CGRect, endFrame: CGRect){
    self.init(frame: initalFrame)
    self.initalFrame = initalFrame
    self.endFrame = endFrame
    setupViews()
  }
  
  private override init(frame: CGRect) {
    endFrame = .zero
    initalFrame = .zero
    super.init(frame: frame)
    backgroundColor = .red
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews(){
    addSubview(videoPlayer)
    videoPlayer.leading(equalTo: leadingAnchor)
    videoPlayer.top(equalTo: topAnchor)
    videoPlayer.trailing(equalTo: trailingAnchor)
    let height = endFrame.width * 9 / 16
    videoPlayerHeightAnchor = videoPlayer.heightAnchor.constraint(equalToConstant: height)
    videoPlayerHeightAnchor?.isActive = true
  }
  
  func animate(completionHandler: (() -> ())? = nil){
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {[unowned self] in
      self.frame = self.endFrame
      let height = self.endFrame.width * 9 / 16
      self.videoPlayerHeightAnchor?.constant = height
    }) { (completed) in
      completionHandler?()
    }
  }
  
  func minimize(completionHandler: (() -> ())? = nil) {
    let width: CGFloat = 150, height: CGFloat = width * 9 / 16, buffer: CGFloat = 20
    
    let maxX = frame.maxX - width - buffer
    let maxY = frame.maxY - height - buffer
    let newFrame = CGRect(x: maxX, y: maxY, width: width, height: height)

    UIView.animate(withDuration: 0.5, animations: {
      self.frame = newFrame
      self.videoPlayerHeightAnchor?.constant = height
    }) { (completed) in
      if completed{
        completionHandler?()
      }
    }
  }
}
