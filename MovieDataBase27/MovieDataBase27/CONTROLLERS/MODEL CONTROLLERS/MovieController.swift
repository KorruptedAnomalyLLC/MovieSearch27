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
    
    var movies: [Movie] = []
    
    /*
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
         */
        
        let baseURL = URL(string: "https://api.themoviedb.org/3/movie")
    var movies: [Movie]?
        
        
        func searchMovies(forMovies movie: String, completion: @escaping (([Movie]) -> Void)) {
            guard let url = baseURL else { completion([]); return }
            
            let movieQuery = URLQueryItem(name: "movie", value: movie.lowercased())
            let jsonQuery = URLQueryItem(name: "output", value: "json")
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.queryItems = [movieQuery, jsonQuery]
            guard let requestURL = components?.url else { completion([]); return }
            
            let dataTask = URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
                if let error = error {
                    print("Error getting movies: \(error.localizedDescription)")
                    completion([])
                    return
                }
                guard let data = data,
                    let responseDataString = String(data: data, encoding: .ascii),
                    let fixedData = responseDataString.data(using: .utf8)
                    else { completion([]); return }
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let resultsDictionary = try jsonDecoder.decode([String: [Movie]].self, from: fixedData)
                    let movieArray = resultsDictionary["results"]
                    completion(movieArray ?? [])
                } catch {
                    print("Error decoding json: \(error.localizedDescription)")
                    completion([])
                    return
                }
            }
            dataTask.resume()
        }
        
        
    }

