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
  
  func configureCell(with weather: Daily) {
    imageView.getImage(with: weather.icon) { (result) in
      DispatchQueue.main.async {
        switch result {
        case .failure:
          self.imageView.image = UIImage(named: "wind")
        case .success(let image):
          self.imageView.image = image
        }
      }
    }
  }
  
}
