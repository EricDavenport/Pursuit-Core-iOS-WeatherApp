//
//  PhotoAPIClient.swift
//  WeatherApp
//
//  Created by Eric Davenport on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation
import NetworkHelper

struct PhotoAPIClient {
  static func getPhotos(for searchQuery: String?,
                        completion: @escaping (Result<[PhotoInfo], AppError>) -> ()) {
    let searchQuery = searchQuery?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "money"
    
    let endpointURL = "https://pixabay.com/api/?key=\(SecretKey.photoKey)&q=\(searchQuery)"
    
    guard let url = URL(string: endpointURL) else {
      completion(.failure(.badURL(endpointURL)))
      return
    }
    
    let request = URLRequest(url: url)
    
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completion(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let results = try JSONDecoder().decode(PhotoObject.self, from: data)
          
          let photos = results.hits
          
          completion(.success(photos))
        } catch {
          completion(.failure(.decodingError(error)))
        }
      }
    }
  }
}
