//
//  MainView.swift
//  WeatherApp
//
//  Created by Eric Davenport on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class MainView: UIView {
  
  public lazy var cityNameLabel : UILabel = {
    let label = UILabel()
    label.text = "CityName"
    label.textColor = .white
    label.textAlignment = .center
    label.backgroundColor = .black
    return label
  }()
  
  public lazy var collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 45, height: 45)
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .orange
    return collectionView
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
    nameLabelSetUp()
    collectionViewSetup()
  }

  private func nameLabelSetUp() {
    addSubview(cityNameLabel)
    
    cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      cityNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      cityNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      cityNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      cityNameLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
    ])
  }
  
  private func collectionViewSetup() {
    addSubview(collectionView)
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 10),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      collectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)
    ])
    
  }


  
  

}
