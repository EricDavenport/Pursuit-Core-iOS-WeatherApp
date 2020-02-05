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
  var name = String() {
    didSet {
      DispatchQueue.main.async {
        self.mainView.cityNameLabel.text = self.name
      }
    }
  }
  
  private var weathers = [WeatherData]() {
    didSet {
      DispatchQueue.main.async {
        self.mainView.collectionView.reloadData()
        self.mainView.cityNameLabel.text = self.name
      }
    }
  }
  
  var photos = [PhotoInfo]()
  
  override func loadView() {
    view = mainView
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      mainView.collectionView.dataSource = self
      mainView.collectionView.delegate = self
      mainView.zipCodeSearchBar.delegate = self
      view.backgroundColor = .systemPink
      
      mainView.collectionView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellWithReuseIdentifier: "weatherCell")
      weatherSearch(zipCode:"11003")
      
    }
  
  func weatherSearch(zipCode: String) {
    
    ZipCodeHelper.getLatLong(fromZipCode: zipCode) { (result) in
      switch result {
      case .failure(let appError):
        print("issue changing string to zip: \(appError)")
      case .success(let lat, let long, let name):
        self.latitude = lat
        self.longitiude = long
        self.name = name

      }
    }
    
    PhotoAPIClient.getPhotos(for: name) { (result) in
      switch result {
      case .failure(let appError):
        print("appError: \(appError)")
      case .success(let photos):
        self.photos = photos
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
    cell.cityNameLabel.text = name
    
    return cell
  }
}

extension MainViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let daily = weathers[indexPath.row]
    
    let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
    guard let detailVc = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {
      fatalError("failed to downcast to DetailViewController")
    }
    
    detailVc.name = name
    print(name)
    detailVc.weather = daily
    print(daily.icon)
    detailVc.photo = photos[indexPath.row]
    
    
//    navigationController?.present(detailVc, animated: true, completion: nil)
    
    navigationController?.pushViewController(detailVc, animated: true)
  }
}

extension MainViewController : UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    
    guard let searchText = searchBar.text else {
      print("missing zip code")
      return
    }
    weatherSearch(zipCode: searchText)
    
  }
}


