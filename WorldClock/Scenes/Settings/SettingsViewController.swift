//
//  SettingsViewController.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/6/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  
  

  @IBOutlet weak var hourSwitcher: UISwitch! {
    didSet {
      hourSwitcher.isOn = UserDefaults.standard.bool(forKey: "24HourSwitcher")
    }
  }
  @IBOutlet weak var settingsView3: UIView!
  @IBOutlet weak var settingsView2: UIView!
  @IBOutlet weak var settingsView1: UIView!
  

  override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    
    
    
    }
  
  
  func setupViews() {
    settingsView1.layer.cornerRadius = 10.0
    settingsView2.layer.cornerRadius = 10.0
    settingsView3.layer.cornerRadius = 10.0

    
  }
  
  @IBAction func switcherValueChanged(_ sender: Any) {
    UserDefaults.standard.set(self.hourSwitcher.isOn, forKey: "24HourSwitcher")

  }
  
}
