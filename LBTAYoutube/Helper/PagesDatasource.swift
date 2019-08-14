//
//  PagesDatasource.swift
//  LBTAYoutube
//
//  Created by Rob on 6/19/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class PageDatasource: NSObject, UICollectionViewDataSource {
  weak var viewController: DetailViewControllerProtocol?
  
  var pages = [PageModel(title: .home, type: HomePageCollectionViewCell.self),
               PageModel(title: .trending, type: TrendingPageCollectionViewCell.self),
               PageModel(title: .subscriptions, type: SubscritpionPageCollectionViewCell.self),
               PageModel(title: .account, type: UICollectionViewCell.self)]
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pages.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellId = pages[indexPath.item].cellId
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    if let cell = cell as? PageCollectionViewCell{
      cell.viewController = viewController
    }
    return cell
  }
  
  func getTitle(for index:Int) -> String{
    return pages[index].title.rawValue
  }
  
}
