//
//  DetailView.swift
//  WeatherApp
//
//  Created by Eric Davenport on 2/4/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailView: UIView {
  
  public lazy var imageView : UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "1.circle")
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
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
    addSubview(imageView)
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      imageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 240)
    ])
    
    
    
    
  }

  
  


}
