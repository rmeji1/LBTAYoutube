//
//  PageModel.swift
//  LBTAYoutube
//
//  Created by Rob on 6/18/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

struct PageModel{
  var title: TitlesEnum
  var type: UICollectionViewCell.Type
  
  var cellId: String{
    return "\(title)Cell"
  }
  
}
