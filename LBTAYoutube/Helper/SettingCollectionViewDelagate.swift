//
//  SettingCollectionViewDelagate.swift
//  LBTAYoutube
//
//  Created by Rob on 6/12/19.
//  Copyright © 2019 Rob. All rights reserved.
//

import UIKit

class SettingCollectionViewDataSourceDelagate: NSObject, UICollectionViewDataSource {
  weak var delegate: SettingProtocol?

  let settings = [Setting(name: "Settings", imageName: "settings"), Setting(name: "Terms & privacy policy", imageName: "privacy"), Setting(name: "Send Feedback", imageName: "feedback"), Setting(name: "Help", imageName: "help"), Setting(name: "Switch Account", imageName: "switch_account"), Setting(name: "Cancel", imageName: "cancel")]
  
  let cellId: String
  
  init(cellId: String, delegate: SettingProtocol) {
    self.cellId = cellId
    self.delegate = delegate
    super.init()
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return settings.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingCollectionViewCell
    cell.setting = settings[indexPath.item]    
    return cell
  }
  
  
}

extension SettingCollectionViewDataSourceDelagate: UICollectionViewDelegate{
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if settings.count - 1 == indexPath.item {
      delegate?.dismiss()
    }else{
      presentViewController(for: settings[indexPath.item])
    }

  }
  
  private func presentViewController(for setting: Setting){
    let viewController = DetailViewController()
    viewController.title = setting.name
    viewController.view.backgroundColor = .white
    delegate?.push(viewController)
  }
}

