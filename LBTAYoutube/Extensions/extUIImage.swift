//
//  File.swift
//  LBTAYoutube
//
//  Created by Rob on 6/10/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

extension UIImage{
  static func from(urlString: String) -> UIImage?{
    guard let url = URL(string: urlString) else {
      return nil
    }
    
    let image : UIImage?
    
    if let cachedImage = cache.object(forKey: NSString(string: urlString) ){
      image = cachedImage
    }else{
      image = try? UIImage(data: Data(contentsOf: url))
      if let image = image {
         cache.setObject(image, forKey: NSString(string: urlString))
      }
    }
    
    return image
  }
}
