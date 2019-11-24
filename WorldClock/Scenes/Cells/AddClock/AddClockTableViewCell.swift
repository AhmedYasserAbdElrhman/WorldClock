//
//  AddClockTableViewCell.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/6/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class AddClockTableViewCell: UITableViewCell, MKMapViewDelegate, AddClockCellView {
  
  @IBOutlet weak var addClockButton: UIButton!

  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var holdingView: UIView!
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var cityName: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    
    self.backgroundColor = .clear
    holdingView.layer.cornerRadius = 10.0
    holdingView.layer.masksToBounds = true
    mapView.showsPointsOfInterest = true
    self.mapView.isHidden = false
    self.addClockButton.isHidden = false
    if let mapView = self.mapView {
      mapView.delegate = self
    }

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
  
  
  func display(cityName: String) {
    self.cityName.text = cityName
  }
  
  
  func display(Time: String) {
    self.timeLabel.text = Time
  }
  
  func display(image: String) {
    self.imageView?.image = UIImage(named: image)
  }

  func showAnotherData() {
    self.mapView.isHidden = false
    self.addClockButton.isHidden = false
    
  }
  
  func hideAnotherData() {
    self.mapView.isHidden = false
    self.addClockButton.isHidden = false

  }
  
  
  
  
 

    
}
