//
//  AddClockPresenter.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/6/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
protocol AddCloclkPresenter {
  func viewDidLoad()
  func search(word: String)
  var numberItemsinSearch: Int {get}
  var numberOfCities: Int {get}
  func configure(cell: AddClockCellView, forRow row: Int, isSearching: Bool)
  func didSelect(forRow row: Int, isSearching: Bool)
  func hieght(forRow row: Int, isSearching: Bool) -> CGFloat 
}

protocol AddClockCellView {
  func display(cityName: String)
  func display(Time: String)
  func display(image: String)
  func showAnotherData()
  func hideAnotherData()
}
class AddClockPresenterImplementation: AddCloclkPresenter {
  let images = ["clock1", "clock2", "clock3", "clock4"]
  var searchCities = [Zone]()
  var cities = [Zone]()
  var numberOfCities: Int {
    if cities.count == 0 {
      return 0
    } else {
      return 10
    }
  }
  var numberItemsinSearch: Int {
    return searchCities.count
  }
  private var view: AddClockView!
  init(view: AddClockView) {
    self.view = view
  }
  
  func viewDidLoad() {
    APIClient.getAllTimes(completion: {[weak self] error,  modelArray in
      guard let strongSelf = self else {return}
      if let error = error {
        print(error)
      } else {
        self?.cities = modelArray!

        for i in (self?.cities.indices)! {
          self?.cities[i].isExpnaded = false
        }
        strongSelf.view.reload()
      }
    })

  }
  
  func configure(cell: AddClockCellView, forRow row: Int,isSearching: Bool) {
    let city: Zone
    switch isSearching {
    case true:
      city = searchCities[row]
    default:
      city = cities[row]
    }
    cell.display(cityName: city.countryName)
    cell.display(Time: TimeCalculator.getTIme(gmtOffset: city.gmtOffset))
    cell.display(image: images.randomElement()!)
    switch city.isExpnaded {
    case true:
      cell.showAnotherData()
    default:
      cell.hideAnotherData()
    }
    
    
  }
  func didSelect(forRow row: Int, isSearching: Bool) {
    var city: Zone
    switch isSearching{
    case true:
      city = searchCities[row]
    case false:
      city = cities[row]
    }
    city.isExpnaded = !city.isExpnaded!
    cities[row] = city
    
  }
  
  func hieght(forRow row: Int, isSearching: Bool) -> CGFloat {
    let city: Zone
    switch isSearching{
    case true:
      city = searchCities[row]
    case false:
      city = cities[row]
    }

    switch city.isExpnaded {
    case true:
      return 300
    default:
      return 120
    }
  }
  
  func search(word: String) {
    searchCities = cities.filter {$0.countryName.contains(word) || $0.zoneName.contains(word)}
    self.view.reload()


  }

}
class TimeCalculator {
  class func getTIme(gmtOffset: Int) -> String {
    let dateFormatter = DateFormatter()
    switch UserDefaults.standard.bool(forKey: "24HourSwitcher") {
    case true:
      dateFormatter.dateFormat = "hh:mm a"
    default:
      dateFormatter.dateFormat = "HH:mm"
    }
    dateFormatter.timeZone = TimeZone(secondsFromGMT: gmtOffset)
    return dateFormatter.string(from: Date())
  }
}
