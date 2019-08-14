//
//  Channel.swift
//  LBTAYoutube
//
//  Created by Rob on 6/10/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import Foundation

struct Channel: Codable {
  let name: String
  let profileImageName: String
  
  enum CodingKeys: String, CodingKey {
    case name
    case profileImageName = "profile_image_name"
  }
}
