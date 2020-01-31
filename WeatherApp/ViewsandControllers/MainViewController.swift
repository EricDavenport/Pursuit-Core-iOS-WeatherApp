//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Eric Davenport on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  private var weather = [Weather]() {
    didSet {
      DispatchQueue.main.async {
        self.mainView.collectionView.reloadData()
      }
    }
  }
  
  private let mainView = MainView()
  
  override func loadView() {
    view = mainView
  }

    override func viewDidLoad() {
        super.viewDidLoad()
//      mainView.collectionView.delegate = self
      mainView.collectionView.dataSource = self
      view.backgroundColor = .systemPink
    }


}

extension MainViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    weather.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? WeatherCell else {
      fatalError("could not downcast to weather")
    }
    
    return cell
  }
}
