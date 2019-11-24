//
//  AddClockViewController.swift
//  WorldClock
//
//  Created by Ahmed Yasser on 11/6/19.
//  Copyright © 2019 Ahmed Yasser. All rights reserved.
//

import UIKit
import MapKit
protocol AddClockView {
  func reload()
}
class AddClockViewController: UIViewController, AddClockView {
  private var configurator: AddClockConfigurator = AddClockConfiguratorImplementation()
  var presenter: AddCloclkPresenter!
  var searchIsActive = Bool()
  var isSearchBarEmpty: Bool {
    return searchBar.text?.isEmpty ?? true
  }


  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = false

  }
  override func viewDidLoad() {
        super.viewDidLoad()
    configurator.configure(viewController: self)
    setupNavBar()
    tableView.backgroundColor = .clear

      let nib = UINib(nibName: "AddClockTableViewCell", bundle: nil)
      tableView.register(nib, forCellReuseIdentifier: "AddClockTableViewCell")
    presenter.viewDidLoad()
    
    
    }
  
  func setupNavBar() {
    self.navigationController?.navigationBar.isTranslucent = true
    self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    
  }
  

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.navigationBar.isHidden = true
  }
  
    

  
}

extension AddClockViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searchIsActive && !isSearchBarEmpty {
      return presenter.numberItemsinSearch
    }
    return presenter.numberOfCities
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AddClockTableViewCell", for: indexPath) as! AddClockTableViewCell
    presenter.configure(cell: cell, forRow: indexPath.row, isSearching: searchIsActive)
    cell.backgroundColor = .clear
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return presenter.hieght(forRow: indexPath.row, isSearching: searchIsActive)
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if true {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddClockTableViewCell", for: indexPath) as! AddClockTableViewCell
        cell.accessoryType = .checkmark
    }
    presenter.didSelect(forRow: indexPath.row, isSearching: searchIsActive)
    tableView.beginUpdates()
    tableView.endUpdates()
    
  }
    
  
  
  
  
}
extension AddClockViewController: UISearchBarDelegate {
  func reload() {
    self.tableView.reloadData()
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    searchIsActive = false
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchIsActive = true
    presenter.search(word: searchBar.text!)
  }
  
//  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//    searchIsActive = true
//  }
  
  
  
}
