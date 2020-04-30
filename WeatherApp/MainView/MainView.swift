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
    let layout = SnappingCollectionViewLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: bounds.size.width - 20, height: 250)
    layout.minimumLineSpacing = 20
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  public lazy var zipCodeSearchBar : UISearchBar = {
    let searchBar = UISearchBar()
//    searchBar.backgroundColor = .brown
    searchBar.placeholder = "enter zipcode"
    return searchBar
  }()
  
  public lazy var infoLabel : UILabel = {
    let label = UILabel()
    label.text = "description"
    label.numberOfLines = 0
    return label
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
    zipCodeSetup()
    descriptionLabelSetup()
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
      collectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.45)
    ])
    
  }
  
  private func zipCodeSetup() {
    addSubview(zipCodeSearchBar)
    
    zipCodeSearchBar.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      zipCodeSearchBar.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15),
      zipCodeSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      zipCodeSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    ])
  }

  private func descriptionLabelSetup() {
    addSubview(infoLabel)
    
    infoLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      infoLabel.topAnchor.constraint(equalTo: zipCodeSearchBar.bottomAnchor, constant: 20),
      infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      
    ])
  }

}


// Must run through
class SnappingCollectionViewLayout: UICollectionViewFlowLayout {

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }

        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let horizontalOffset = proposedContentOffset.x + collectionView.contentInset.left

        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)

        let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)

        layoutAttributesArray?.forEach({ (layoutAttributes) in
            let itemOffset = layoutAttributes.frame.origin.x
            if fabsf(Float(itemOffset - horizontalOffset)) < fabsf(Float(offsetAdjustment)) {
                offsetAdjustment = itemOffset - horizontalOffset
            }
        })

        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }
}
