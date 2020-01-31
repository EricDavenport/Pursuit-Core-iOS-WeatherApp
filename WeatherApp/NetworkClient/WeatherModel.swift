//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Eric Davenport on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct Weather : Codable {
  let latitude : Double
  let longitude : Double
  let timezone : String
//  let currently : Currently
//  let minutely : Minutely
//  let hourly : Hourly
  let daily : Daily
  
}

//struct Currently : Codable {
//  let time : Int
//  let summary : String
//  let icon : String
//  let temperature : Double
//}

//struct Minutely : Codable {
//
//}
//
//struct Hourly : Codable {
//
//}

struct Daily : Codable {
  let summary : String
  let icon : String
  let data : WeatherData
}

struct WeatherData : Codable {
  let time : Int
  let summary : String
  let sunriseTime : Int
  let sunsetTime : Int
  let moonPhase : Double
  let precipType : String
  let temperatureLow : Double
  let temperatureHigh : Double
  let visibility : Int
}
