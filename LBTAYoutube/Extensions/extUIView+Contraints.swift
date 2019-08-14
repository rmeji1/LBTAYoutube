//
//  extUIView+Contraints.swift
//  LBTAYoutube
//
//  Created by Rob on 6/7/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

extension UIView{
  func horizontally(equalTo view: UIView, isInsafeArea: Bool = true) {
    if isInsafeArea{
      let layoutMargins = view.layoutMarginsGuide
      leadingAnchor.constraint(equalTo: layoutMargins.leadingAnchor).isActive = true
      trailingAnchor.constraint(equalTo: layoutMargins.trailingAnchor).isActive = true
    }else{
      leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
  }
  
  func height(equalTo constant: CGFloat){
    heightAnchor.constraint(equalToConstant: constant).isActive = true
  }
  
  func height(equalTo dimension: NSLayoutDimension){
    heightAnchor.constraint(equalTo: dimension).isActive = true
  }
  
  func width(equalTo constant: CGFloat){
    widthAnchor.constraint(equalToConstant: constant).isActive = true
  }
  
  func width(equalTo dimension: NSLayoutDimension){
    widthAnchor.constraint(equalTo: dimension).isActive = true
  }
  
  func top(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0){
    if constant != 0{
      self.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }else{
      self.topAnchor.constraint(equalTo: anchor).isActive = true
    }
  }
  
  func bottom(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant: CGFloat = 0){
    if constant != 0{
      self.bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }else{
      self.bottomAnchor.constraint(equalTo: anchor).isActive = true
    }
  }
  
  func leading(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) {
    if constant != 0{
      self.leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }else{
      self.leadingAnchor.constraint(equalTo: anchor).isActive = true
    }
  }
  
  func trailing(equalTo anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, constant: CGFloat = 0) {
    if constant != 0{
      self.trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }else{
      self.trailingAnchor.constraint(equalTo: anchor).isActive = true
    }
  }
  
  func center(in view: UIView){
    centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  func fill(in view: UIView){
    top(equalTo: view.topAnchor)
    bottom(equalTo: view.bottomAnchor)
    horizontally(equalTo: view, isInsafeArea: false)
  }
}
