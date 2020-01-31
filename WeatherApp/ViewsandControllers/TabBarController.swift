//
//  TabBarController.swift
//  WeatherApp
//
//  Created by Eric Davenport on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  private lazy var mainViewController : MainViewController = {
    let viewController = MainViewController()
    viewController.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "cloud.moon.bolt"), selectedImage: UIImage(systemName: "cloud.moon.bolt.fill"))
    return viewController
  }()
  
  private lazy var favsViewController : FavsViewController = {
    let viewController = FavsViewController()
    viewController.tabBarItem = UITabBarItem(title: "Favs", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
    return viewController
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      
      view.backgroundColor = .green
    
      viewControllers = [mainViewController, favsViewController]
    }
    
  
  


}
