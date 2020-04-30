//
//  FavsViewController.swift
//  WeatherApp
//
//  Created by Eric Davenport on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit
import DataPersistence

class FavsViewController: UIViewController {
  
  private let favsView = FavsView()
  
  let dataPersistence = DataPersistence<PhotoInfo>(filename: "favePhoto")

  
  var favs = [PhotoInfo]()  {
    didSet {
      DispatchQueue.main.async {
        self.favsView.tableView.reloadData()
      }
    }
  }
  
  override func loadView() {
    view = favsView
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      loadFavs()
      favsView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "favsCell")
      favsView.tableView.dataSource = self
      favsView.tableView.delegate = self
      favsView.tableView.register(FavCell.self, forCellReuseIdentifier: "favsCell")
      view.backgroundColor = .systemGroupedBackground
    }
    
  func loadFavs() {
    do {
      favs = try dataPersistence.loadItems()
      } catch {
        print("failed to load favorites")
      }
  }


}

extension FavsViewController : UITableViewDataSource , UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "favsCell", for: indexPath) as? FavCell else {
      fatalError("unable to downcast FavCell")
    }
    let fav = favs[indexPath.row]
    cell.configureCell(photo: fav)

    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return favs.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 350
  }
  
  

}
