//
//  CineData.swift
//  CineSearch
//
//  Created by Cem Akkaya on 17/02/26.
//

import Foundation

struct MovieResponse: Decodable, Sendable {
    let results: [Movie]
}

struct Movie: Decodable, Identifiable, Sendable {
    let id: Int
    let originalTitle: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
    
    var posterURL: URL? {
        guard let posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
}
