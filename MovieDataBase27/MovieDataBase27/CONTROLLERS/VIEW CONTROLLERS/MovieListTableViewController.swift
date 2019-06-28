//
//  MovieListTableViewController.swift
//  MovieDataBase27
//
//  Created by Austin West on 6/28/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {

   let movieController = MovieController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return movieController.movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)

        // Configure the cell...

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    
}
