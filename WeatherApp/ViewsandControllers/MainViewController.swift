//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Eric Davenport on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  private let mainView = MainView()
  
  var zipCode = String()
  var latitude = Double()
  var longitiude = Double()
  
  private var weathers = [WeatherData]() {
    didSet {
      DispatchQueue.main.async {
        self.mainView.collectionView.reloadData()
      }
    }
  }
  
  override func loadView() {
    view = mainView
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      mainView.collectionView.dataSource = self
      mainView.zipCodeSearchBar.delegate = self
      view.backgroundColor = .systemPink
      
      mainView.collectionView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: "weatherCell")
      weatcherSearch(zipCode:"")
      
    }
  
  func weatcherSearch(zipCode: String = "11691") {
    
    ZipCodeHelper.getLatLong(fromZipCode: "11413") { (result) in
      switch result {
      case .failure(let appError):
        print("issue changing string to zip: \(appError)")
      case .success(let lat, let long):
        self.latitude = lat
        self.longitiude = long
        
      }
    }
    
    WeatherAPIClient.getWeather(with: latitude, long: longitiude) { (result) in
      switch result {
      case .failure(let appError):
        print("appError:\(appError)")
      case .success(let daily):
        self.weathers = daily
      }
    }
  }


}

extension MainViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return weathers.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
      fatalError("could not downcast to weather")
    }
    
    let weather = weathers[indexPath.row]
    cell.backgroundColor = .white
    
    cell.configureCell(with: weather)
    
    
    return cell
  }
  
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 400, height: 420)
  }
  
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 1.0
  }

  func collectionView(_ collectionView: UICollectionView, layout
      collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 1.0
  }
}




extension MainViewController : UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    
    guard let searchText = searchBar.text else {
      print("missing zip code")
      return
    }
    weatcherSearch(zipCode: searchText)
    
  }
}
