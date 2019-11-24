//
//  ViewController.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/5/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
class MainViewController: UIViewController {

  @IBOutlet weak var clockImageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSecondsPointer()
    setupMinutesPointer()
  }
  
  
  
  func setupSecondsPointer() {
    let pointer = CAShapeLayer()
    pointer.path = buildArrow(lenght: 100).cgPath
    pointer.strokeColor = UIColor.darkGray.cgColor
    pointer.lineWidth = 6
    pointer.lineCap = .round
    pointer.anchorPoint = CGPoint(x: 0.5, y: 0.2)
    buildInview(view: clockImageView, layer: pointer)
    buildAnimation(layer: pointer, duration: 60)

    
  }
  
  func setupMinutesPointer() {
    let pointer = CAShapeLayer()
    pointer.path = buildArrow(lenght: 150).cgPath
    pointer.strokeColor = UIColor.darkGray.cgColor
    pointer.lineWidth = 4
    pointer.lineCap = .round
    let overLayer = CAShapeLayer()
    overLayer.path = buildArrow(lenght: 150).cgPath
    overLayer.strokeColor = UIColor.red.cgColor
    overLayer.lineWidth = 2
    buildInview(view: clockImageView, layer: pointer)
    buildInview(view: clockImageView, layer: overLayer)
    buildAnimation(layer: pointer, duration: 3600)
    buildAnimation(layer: overLayer, duration: 3600)
    
    
  }


  func buildArrow(lenght: CGFloat) -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: .zero)
    let endPoint = CGPoint(x: 0, y: -lenght)
    path.addLine(to: endPoint)
    
    return path
  }
  
  func buildInview(view: UIView, layer: CAShapeLayer) {
    layer.frame.origin = CGPoint(x: view.frame.origin.x / 2, y: view.frame.origin.y / 2)
    layer.anchorPoint = view.center
    view.layer.addSublayer(layer)
    layer.position = CGPoint(x: view.bounds.midX, y: view.bounds.midY + 30.0)
  }
  
  
  func buildAnimation(layer: CAShapeLayer, duration: CFTimeInterval ) {
    let animation = CABasicAnimation(keyPath: "transform.rotation.z")
    animation.duration = duration
    animation.fromValue = 0
    animation.toValue = Float.pi * 2
    animation.repeatCount = .greatestFiniteMagnitude
    layer.add(animation, forKey: "time")
    
    
  }


}




