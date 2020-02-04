//
//  FavsViewController.swift
//  WeatherApp
//
//  Created by Eric Davenport on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class FavsViewController: UIViewController {
  
  private let favsView = FavsView()
  
  override func loadView() {
    view = favsView
  }

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .systemIndigo
    }
    



}
