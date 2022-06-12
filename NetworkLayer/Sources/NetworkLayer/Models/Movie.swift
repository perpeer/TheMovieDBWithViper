//
//  File.swift
//  
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import Foundation

public struct PopularMovieListResponse: Decodable {
    public let results: [Movie]
}

public struct Movie: Decodable {
    public let id: Int
    public let title: String
    public let voteAverage: Double
    public let releaseDate: Date
    public let posterPath: String
    public let overview: String
}
