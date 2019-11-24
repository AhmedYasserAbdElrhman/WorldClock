//
//  AddClockConfigurator.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/6/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
protocol AddClockConfigurator {
  func configure(viewController: AddClockViewController)
}

class AddClockConfiguratorImplementation: AddClockConfigurator {
  func configure(viewController: AddClockViewController) {
    let presenter = AddClockPresenterImplementation(view: viewController)
    viewController.presenter = presenter
    
  }
  
  
}
