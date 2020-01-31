//
//  WeatherAPIClient.swift
//  WeatherApp
//
//  Created by Eric Davenport on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct weatherAPIClient {
  static func fetchWeather(with zip: String, completion: @escaping (Result<[Weather], AppError>) -> ()) {
    
    let endpointURLString = "https://api.darksky.net/forecast/97a0e6f62487cd98ab7280505d8c0156/37.8267,-122.4233"
    guard let url = URL(string: endpointURLString) else {
      completion(.failure(.badURL(endpointURLString)))
      return
    }
    let request = URLRequest(url: url)
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completion(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let search = try JSONDecoder().decode([Weather].self, from: data)
          completion(.success(search))
        } catch {
          completion(.failure((.decodingError(error))))
        }
      }
    }
  }
}

