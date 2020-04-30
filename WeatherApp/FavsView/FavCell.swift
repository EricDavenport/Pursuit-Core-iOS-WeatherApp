//
//  FavCell.swift
//  WeatherApp
//
//  Created by Eric Davenport on 4/30/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavCell: UITableViewCell {
  
  public lazy var newImageView : UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .white
    return imageView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: "favsCell")
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    imageViewSetup()
  }
  
  private func imageViewSetup() {
    addSubview(newImageView)
    newImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      newImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      newImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
      newImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      newImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    ])
  }
  
  public func configureCell(photo: PhotoInfo) {
    newImageView.getImage(with: photo.largeImageURL, completion: { [weak self] (result) in
         DispatchQueue.main.async {
           switch result {
           case .failure(let appError):
//            showAlert(title: "Error", message: "issue loading favorites: \(appError)")
            print("Error loading image: \(appError)")
           case .success(let image):
            self?.newImageView.image = image
           }
         }
       })
  }
  
  
  
}
