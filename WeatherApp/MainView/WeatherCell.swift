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
    
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var cityNameLabel: UILabel!
  @IBOutlet weak var lowLabel: UILabel!
  @IBOutlet weak var sunriseLabel: UILabel!
  @IBOutlet weak var sunsetLabel: UILabel!
  @IBOutlet weak var moonPhaseLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var percipTypeLabel: UILabel!
  @IBOutlet weak var highLabel: UILabel!
  
  
  func configureCell(with weather: WeatherData) {
    let dateFormatter = DateFormatter()
    let timeInterval : TimeInterval = Double(weather.sunsetTime!)
    let timeInterval2 : TimeInterval = Double(weather.sunriseTime!)
    let date = Date(timeIntervalSince1970: timeInterval)
    let date2 = Date(timeIntervalSince1970: timeInterval2)
    dateFormatter.dateFormat = "H:mm"
    let sunsetTime = dateFormatter.string(from: date)
    let sunriseTime = dateFormatter.string(from: date2)
   // let sunriseTime = DateFormatter().date(from: String(weather.sunriseTime!))
    
    imageView.image = UIImage(named: weather.icon)
    //summaryLabel.text = weather.summary
    cityNameLabel.text = weather.icon.uppercased()
    highLabel.text = "High: \(weather.temperatureHigh)"
    lowLabel.text = "low: \(weather.temperatureLow)"
    sunriseLabel.text = "Sunset: \(sunsetTime)"
    sunsetLabel.text = "Sunset: \(String(describing: sunriseTime))"
    moonPhaseLabel.text = "MoonPhase: \(weather.moonPhase)"
    timeLabel.text = "Time: \(String(describing: weather.time))"
    percipTypeLabel.text = weather.precipType
    
    

    
    
//  }
//  func sunsetTimefunc(weather: WeatherData) -> String {
//  let timeInterval : TimeInterval = Double(weather.sunsetTime)
//  let date = Date(timeIntervalSince1970: timeInterval)
//  let dateFormatter = DateFormatter()
//  dateFormatter.dateFormat = "HH:mm"
//  return dateFormatter.string(from: date)
//    
//  }
//  
//  func sunriseTimefunc(weather: WeatherData) -> String {
//  let timeInterval : TimeInterval = Double(weather.sunriseTime)
//  let date = Date(timeIntervalSince1970: timeInterval)
//  let dateFormatter = DateFormatter()
//  dateFormatter.dateFormat = "HH:mm"
//  dateFormatter.string(from: date)

  
  }



}
