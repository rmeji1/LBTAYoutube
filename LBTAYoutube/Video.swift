//
//  Video.swift
//  LBTAYoutube
//
//  Created by Rob on 6/10/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import Foundation

struct Video: Codable {
  let title: String
  let numberOfViews: Int
  let thumbnailImageName: String
  let channel: Channel
  let duration: Int
  
  enum CodingKeys: String, CodingKey {
    case title
    case numberOfViews = "number_of_views"
    case thumbnailImageName = "thumbnail_image_name"
    case channel, duration
  }
}
