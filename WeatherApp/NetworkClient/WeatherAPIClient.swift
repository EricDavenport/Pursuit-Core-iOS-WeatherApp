//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by Eric Davenport on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//
 
import Foundation
import NetworkHelper


struct WeatherAPIClient {
  static func getWeather(with lat: Double, long: Double, completion: @escaping (Result<[WeatherData], AppError>) -> ()) {
    let endpointString = "https://api.darksky.net/forecast/\(SecretKey.key)/\(lat),\(long)"
    
    guard let url = URL(string: endpointString) else {
      completion(.failure(.badURL(endpointString)))
      return
    }
    
    let request = URLRequest(url: url)
    
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completion(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
        let results = try JSONDecoder().decode(Weather.self, from: data)
          let daily = results.daily.data
        
        completion(.success(daily))
        } catch {
          completion(.failure(.decodingError(error)))
        }
      }
    }
    
    
  }
}
