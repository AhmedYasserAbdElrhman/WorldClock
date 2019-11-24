//
//  MyTabBar.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/5/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class MyTabBar: UITabBar {

  override func draw(_ rect: CGRect) {
    super.draw(rect)
    setup()
  }
  
  func setup() {
    self.isTranslucent = true
    self.backgroundColor = UIColor.clear
    self.backgroundImage = UIImage()
    self.shadowImage = UIImage()
    self.clipsToBounds = false
    
  }

}

class MyTabBarController: UITabBarController {
  override func viewDidLoad() {
    navigationController?.navigationBar.isHidden = true
  }
}
