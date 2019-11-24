//
//  CityTimeModel.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/6/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
struct Welcome: Codable {
  let status, message: String
  let zones: [Zone]
}

struct Zone: Codable {
  let countryCode, countryName, zoneName: String
  let gmtOffset, timestamp: Int
  var isExpnaded: Bool?
  mutating func changeisExpanded(newValue: Bool) {
    isExpnaded = newValue
  }

}


