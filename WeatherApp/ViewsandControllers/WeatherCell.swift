//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Eric Davenport on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import  ImageKit

class WeatherCell: UICollectionViewCell {
  
  @IBOutlet weak var summaryLabel: UILabel!
  
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var cityNameLabel: UILabel!
  
  func configureCell(with weather: WeatherData) {
    imageView.image = UIImage(named: weather.icon)
    //summaryLabel.text = weather.summary
    cityNameLabel.text = weather.icon.uppercased()
  }
  
}
