//
//  MoreView.swift
//  LBTAYoutube
//
//  Created by Rob on 6/11/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class MoreView: UIView {
  weak var delegate: ViewControllerProtocol?
  
  private enum MoreViewState: CGFloat{
    case open = 0
    case closed = 300
  }
  private enum BackgroundState: CGFloat{
    case visible = 0.6
    case hidden = 0
  }
  
  var moreViewBottomConstaint: NSLayoutConstraint?
  
  let backgroundView: UIView = {
    let view = UIView()
    view.backgroundColor = .darkGray
    view.alpha = BackgroundState.visible.rawValue
    return view
  }()
  
  lazy var moreView: SettingView = {[weak self] in
    let view = SettingView()
    view.delegate = self
    return view
  }()
  
  var completion: (() -> ())?
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addAllSubviews()
    backgroundView.fill(in: self)
    moreView.height(equalTo: MoreViewState.closed.rawValue)
    moreView.width(equalTo: widthAnchor)
    moreView.leading(equalTo: leadingAnchor)
    moreViewBottomConstaint = moreView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: MoreViewState.open.rawValue)
    moreViewBottomConstaint?.isActive = true
  }
  
  func addAllSubviews() {
    [backgroundView, moreView].forEach { (view) in
      addSubview(view)
      view.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  func setIsHidden(_ isHidden: Bool, animated: Bool = true) {
    guard let moreViewBottomConstraint = moreViewBottomConstaint else {
      return
    }
    
    if !isHidden { // show view
      self.isHidden = false
      openOrCloseMoreView(moreViewBottomConstraint)
    }else if animated{ // hide with animation
      openOrCloseMoreView(moreViewBottomConstraint)
    }else{ // hide without animation used when view first created.
      self.isHidden = true
      closeImmediatly(moreViewBottomConstraint)
    }
  }
  
  fileprivate func openOrCloseMoreView(_ moreViewBottomConstraint: NSLayoutConstraint) {
    switch moreViewBottomConstraint.constant {
    case MoreViewState.closed.rawValue:
      changeMoreViewContrainstConstant(moreViewBottomConstraint, MoreViewState.open.rawValue)
    case MoreViewState.open.rawValue:
      changeMoreViewContrainstConstant(moreViewBottomConstraint, MoreViewState.closed.rawValue)
    default:
      break
    }
  }
  
  fileprivate func changeMoreViewContrainstConstant(_ moreViewBottomConstraint: NSLayoutConstraint, _ constant: CGFloat) {
    backgroundView.isUserInteractionEnabled = false

    UIView.animate(withDuration: 0.5, animations: {[unowned self] in
      self.performAnimations(moreViewBottomConstraint, constant)
    }) { (completed) in
      self.cleanUp(if: completed, constant: constant)
    }
  }
  
  fileprivate func performAnimations(_ moreViewBottomConstraint: NSLayoutConstraint, _ constant: CGFloat) {
    let alpha = self.backgroundView.alpha
    let hidden = BackgroundState.hidden.rawValue
    let visible = BackgroundState.visible.rawValue

    // can't used BackgroundState.visible for comparasion because alpha will always have gibberish
    // at the end of var for example it won't be 0.6 instead will be 0.6000000238418579 
    self.backgroundView.alpha = (alpha == BackgroundState.hidden.rawValue) ? visible : hidden
    moreViewBottomConstraint.constant = constant
    self.layoutIfNeeded()
  }
  
  fileprivate func cleanUp(if completed: Bool, constant: CGFloat){
    if completed{
      if constant == MoreViewState.closed.rawValue{
        self.isHidden = true
      }
      self.backgroundView.isUserInteractionEnabled = true
      if completion != nil{
        completion?()
        completion = nil
      }
    }
  }
  
  private func closeImmediatly(_ moreViewBottomConstraint: NSLayoutConstraint){
    self.isHidden = true
    moreViewBottomConstraint.constant = MoreViewState.closed.rawValue
    backgroundView.alpha = BackgroundState.hidden.rawValue
  }
}

extension MoreView: MoreViewProtocol{
  func push(_ viewController: UIViewController) {
    setIsHidden(true)
    completion = {[weak self] in
      self?.delegate?.push(viewController)
    }
  }
  
  func dismiss() {
    setIsHidden(true)
  }
}
