//
//  NetworkManager.swift
//  CineSearch
//
//  Created by Cem Akkaya on 17/02/26.
//

import Foundation
import Observation

@Observable
class NetworkManager {
    
    var movies = [Movie]()
    
    @MainActor
    func fetchMovies() async {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(Secrets.apiKey)&language=en-US&page=1") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(MovieResponse.self, from: data)
            
            self.movies = decodedData.results
            
            print("Fetch movies number: \(self.movies.count)")
            
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
