//
//  VideoLauncher.swift
//  LBTAYoutube
//
//  Created by Rob on 6/29/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

struct VideoLauncher{
  func launch() {
    if let keyWindow = UIApplication.shared.keyWindow{
      let keyWindowFrame = keyWindow.safeAreaLayoutGuide.layoutFrame
      
      let maxX = keyWindowFrame.maxX - 10
      let maxY = keyWindowFrame.maxY - 10
      
      let intialVideoViewFrame = CGRect(x: maxX, y: maxY, width: 10, height: 10)
      let videoView = VideoDetailView(initalFrame: intialVideoViewFrame, endFrame: keyWindowFrame)
      
      keyWindow.addSubview(videoView)
      
      videoView.animate {
        
      }
    }
  }
  
//  private func animateVideoView
}
