//
//  SubscritpionPageCollectionViewCell.swift
//  LBTAYoutube
//
//  Created by Rob on 6/19/19.
//  Copyright © 2019 Rob. All rights reserved.
//

class SubscritpionPageCollectionViewCell: PageCollectionViewCell {
  override func load() {
    VideoService.shared.load(for: .subscriptions) { (result) in
      switch result {
      case .success(let videos):
        self.videos = videos
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
