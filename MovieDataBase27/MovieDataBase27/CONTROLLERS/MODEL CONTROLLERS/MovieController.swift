//
//  MovieController.swift
//  MovieDataBase27
//
//  Created by Austin West on 6/28/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

class MovieController {
    
    static let sharedInstance = MovieController()
    
    func fetchMovie(searchTerm: String, completion: @escaping (Movie?) -> Void) {
        
        if let url = URL(string: "https://api.themoviedb.org/3/movie") {
            var request = URLRequest(url: url)
            request.addValue("621c011ff27583f12f2c0f2fce7cd6d8", forHTTPHeaderField: "API Key")
            request.httpMethod = "GET"
            let dataTask = URLSession.shared.dataTask(with: request) {
                (data: Data?, responce: URLResponse?, error: Error?) in
            }
            dataTask.resume()
        }
    }
}
