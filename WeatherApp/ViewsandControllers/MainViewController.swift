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
  
  private var weathers = [Daily]() {
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
    WeatherAPIClient.fetchWeatcher { (result) in
      switch result {
      case .failure(let appError):
        print("error: \(appError)")
      case .success(let weather):
        self.weathers = weather
      }
    }
  }


}

extension MainViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    weathers.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
      fatalError("could not downcast to weather")
    }
    
    let weather = weathers[indexPath.row]
    
    cell.configureCell(with: weather)
    
    
    return cell
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
