//
//  DetailVideoViewController.swift
//  LBTAYoutube
//
//  Created by Rob on 6/29/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class DetailVideoViewController: UIViewController {
  var initialCenter: CGPoint?

  lazy var swipeDownGesture: UIPanGestureRecognizer = { [unowned self] in
    let gesture = UIPanGestureRecognizer(target: self, action: #selector(miniView))
    return gesture
  }()
  
  lazy var tapGesture: UITapGestureRecognizer = { [unowned self] in
    let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedView))
    return gesture
  }()
  
  override func loadView() {
    if let keyWindow = UIApplication.shared.keyWindow{
      view = VideoDetailView(initalFrame: CGRect.zero, endFrame: keyWindow.frame)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addGestureRecognizer(swipeDownGesture)
    view.addGestureRecognizer(tapGesture)
    tapGesture.isEnabled = false
  }
  
  override func viewDidAppear(_ animated: Bool) {
    if let detailVideoView = view as? VideoDetailView{
      detailVideoView.animate()
    }
  }

  @objc private func miniView(_ gestureRecognizer : UIPanGestureRecognizer){
    guard let view = view as? VideoDetailView else {return}
    if gestureRecognizer.state == .ended{
      view.minimize {
        self.didMove(toParent: self.parent)
        self.updateGesture()
      }
    }
  }
  
  @objc private func tappedView(){
    guard let playVideoView = view as? VideoDetailView else { return }
    playVideoView.animate(){ [unowned self] in
      self.updateGesture()
    }
  }
  
  
  func adjustVideoPlayerHeight(to height: CGFloat){
    guard let playVideoView = view as? VideoDetailView else { return }
    playVideoView.videoPlayerHeightAnchor?.constant = height
  }
  
  func updateGesture(){
    swipeDownGesture.isEnabled = !swipeDownGesture.isEnabled
    tapGesture.isEnabled = !tapGesture.isEnabled
  }
}
