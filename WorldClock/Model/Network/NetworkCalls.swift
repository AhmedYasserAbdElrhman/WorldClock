//
//  NetworkCalls.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/6/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import Alamofire
class APIClient {
  class func getAllTimes(completion: @escaping (Error?, [Zone]?) -> Void) {
    Alamofire.request(NetworkRoute.getAllTimeZone) .validate() .responseJSON { response in
      switch response.result {
      case .success(let value):
        do {
          let myModel = try JSONDecoder().decode(Welcome.self, from: response.data!)
          completion(nil, myModel.zones)

        }
        catch {}
        print(value)
      case .failure(let error):
        print(error)
        completion(error, nil)
      }
    }
  }
}
