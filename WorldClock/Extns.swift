//
//  Extns.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/6/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
class ProfilePictureView: UIImageView {
  
  func setup() {
    
    self.layer.masksToBounds = true
    self.layer.cornerRadius = self.frame.size.height / 2
    self.clipsToBounds = true
  }
  
  
  override func layoutSubviews() {
    setup()
  }
  
  
  
  
  
}

extension UIViewController {
  @IBAction func addClockButtonAction(_ sender: UIButton) {
    let controller = storyboard?.instantiateViewController(withIdentifier: "AddClockViewController") as! AddClockViewController
    navigationController?.pushViewController(controller, animated: true)
  }
}
