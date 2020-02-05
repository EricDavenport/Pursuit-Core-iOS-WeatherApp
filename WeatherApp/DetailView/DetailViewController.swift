//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Eric Davenport on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import ImageKit

class DetailViewController: UIViewController {
  
  var weather : WeatherData?
  var name = ""
  var photo : PhotoInfo?
  
  @IBOutlet weak var cityNameLabel: UILabel!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var forecastLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var summaryLabel: UILabel!
  @IBOutlet weak var sunriseLabel: UILabel!
  @IBOutlet weak var sunsetLabel: UILabel!
  @IBOutlet weak var highLabel: UILabel!
  @IBOutlet weak var lowLabel: UILabel!
  @IBOutlet weak var windspeedLabel: UILabel!
  @IBOutlet weak var precipitationLabel: UILabel!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .red
    
    updateUI()
    }
    
  
  func updateUI() {

    cityNameLabel.text = name
    forecastLabel.text = weather?.icon
    highLabel.text = "High: \(weather?.temperatureHigh)"
    lowLabel.text = "Low: \(weather?.temperatureLow)"
    summaryLabel.text = weather?.summary
    
    imageView.getImage(with: photo!.largeImageURL) { [weak self] (result) in
      DispatchQueue.main.async {
      switch result {
      case .failure(let appError):
        print("App Error: \(appError)")
      case .success(let image):
        self?.imageView.image = image
        }
      }
    }
    
}
}
