//
//  LocationVerfier.swift
//  Harmony
//
//  Created by Ahmed Yasser on 8/28/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import CoreLocation

class LocationVerfier {
    
  let locationManger = CLLocationManager()


  func checkLocationServices(closure: (Bool) -> ()) {
    closure(CLLocationManager.locationServicesEnabled())
    
  }
  
  func checkLocationAuthorization(completion: () -> Void) {
    switch CLLocationManager.authorizationStatus() {
    case .authorizedWhenInUse, .authorizedAlways:
      locationManger.startUpdatingLocation()
      completion()
    case .denied:
      break
    case .restricted:
      break
    case .notDetermined:
      locationManger.requestAlwaysAuthorization()
    }

  }
  
  
  func setupLocationManger() {
    locationManger.desiredAccuracy = kCLLocationAccuracyBest
  }
  
  

}



