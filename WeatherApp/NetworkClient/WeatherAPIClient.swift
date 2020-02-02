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
  static func fetchWeatcher(completion: @escaping (Result<[Daily], AppError>) -> ()) {
    let endpointString = "https://api.darksky.net/forecast/97a0e6f62487cd98ab7280505d8c0156/37.8267,-122.4233"
    guard let url = URL(string: endpointString) else {
      completion(.failure(.badURL(endpointString)))
      return
    }
    let request = URLRequest(url: url)
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure:
        completion(.failure(.badURL(endpointString)))
        return
      case .success(let data):
        do {
          let results = try JSONDecoder().decode(Weather.self, from: data)
          
          let daily = results.daily
          
          completion(.success(daily))
        } catch {
          completion(.failure(.decodingError(error)))
        }
      }
    }
    
  }
  
}

