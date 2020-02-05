//
//  PhotoModel.swift
//  WeatherApp
//
//  Created by Eric Davenport on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct PhotoObject: Codable {
  let hits: [PhotoInfo]
}

struct PhotoInfo: Codable & Equatable {
  let largeImageURL : String
  let likes : Int
  let views : Int
  let tags : String
  let previewURL : String
  let favorites : Int
  let webformatURL : String
}
