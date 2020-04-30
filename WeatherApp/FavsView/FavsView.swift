//
//  FavsView.swift
//  WeatherApp
//
//  Created by Eric Davenport on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavsView: UIView {
  
  public lazy var tableView : UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .systemGroupedBackground
    return tableView
  }()
  
  public lazy var imageView : UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .white
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
    tableViewSetup()
  }
  
  private func imageViewSetup() {
    tableView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.widthAnchor.constraint(equalTo: tableView.widthAnchor, multiplier: 0.10)
    
  }
  
  
  private func tableViewSetup() {
    addSubview(tableView)
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
    ])
  }


}
