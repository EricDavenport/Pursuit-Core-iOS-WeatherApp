//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Eric Davenport on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  var weather : WeatherData?
  var name = String()
  
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
    PhotoAPIClient.getPhotos(for: name) { [weak self] (result) in
      switch result {
      case .failure(let appError):
        print("Error: \(appError)")
      case .success(let photos):
        self?.imageView.getImage(with: photos.first!.largeImageURL) { (result) in
          switch result {
          case .failure:
            self?.imageView.image = UIImage(systemName: "photo")
          case .success(let image):
            self?.imageView.image = image
        }
    }
    }
  }
}
}





// A Label naming the city and the forecast date
// A random image of the city
// A Label with a longer description of the weather
// Additional information about the weather including the high, low, sunrise, sunset, windspeed and precipitation
// Selecting the "Save" bar button item should save the image to your favorites and present an alert view informing the user.
