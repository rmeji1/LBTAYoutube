//
//  ViewControllerProtocol.swift
//  LBTAYoutube
//
//  Created by Rob on 6/12/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import Foundation

protocol ViewControllerProtocol: MoreViewProtocol {
  func scrollToMenuItem(at index: Int)
  func updateTitleView(with index: Int)
}

extension ViewControllerProtocol{
  func dismiss() {
    
  }
}
