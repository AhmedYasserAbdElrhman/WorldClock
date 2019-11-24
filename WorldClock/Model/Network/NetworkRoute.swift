//
//  NetworkRoute.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/6/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import Foundation
import Alamofire
enum NetworkRoute :URLRequestConvertible {
  case getAllTimeZone
  
  func asURLRequest() throws -> URLRequest {
    var method : HTTPMethod {
      switch self {
      default:
        return .get
      }
    }
    let parameters : ([String: Any]?) = {
      switch self {
      default:
        return nil
      }
    }()
    
    let url : URL = {
      let destURL : String?
      switch  self {
      default:
        destURL = "https://api.timezonedb.com/v2.1/list-time-zone?key=CGV550DNWU2X&format=json"
      }
      var url : URL!
      if let destURL = destURL {
        url = URL(string: destURL)
      }
      return url
      
    }()
    let headers : HTTPHeaders? = {
      let authHeaders : [String:String]?
      switch self {
      default:
        return nil
      }
      return  authHeaders
    }()
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    let encoding : ParameterEncoding = {
      switch method {
      default:
        return JSONEncoding.default
      }
    }()
    return try encoding.encode(urlRequest, with: parameters)
    
  }
  
}

