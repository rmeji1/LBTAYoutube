//
//  VideoPageCollectionViewCell.swift
//  LBTAYoutube
//
//  Created by Rob on 6/18/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class HomePageCollectionViewCell: PageCollectionViewCell {
  override var layout: UICollectionViewFlowLayout {
    return DashboardVideoFlowLayout()
  }
  
  override var cellId: String{
    return "CellId"
  }
  
  override var cellType: UICollectionViewCell.Type{
    return DashboardCollectionViewCell.self
  }
  
  var videos: [Video] = []{
    didSet{
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
  
  override func load() {
    loadVideos()
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return videos.count
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DashboardCollectionViewCell
    cell.video = videos[indexPath.item]
    return cell
  }

  private func loadVideos(){
    VideoService.shared.load(for: .home) {[unowned self] (result) in
      switch result{
      case .success(let videos):
        self.videos = videos
      case .failure(let error):
        print(error)
      }
    }
  }
}
