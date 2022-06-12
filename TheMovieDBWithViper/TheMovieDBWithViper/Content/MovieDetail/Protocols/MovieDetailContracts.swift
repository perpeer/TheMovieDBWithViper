//
//  MovieDetailContracts.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import Foundation
import struct NetworkLayer.Movie

final class MovieDetailPresentation {
    private let movie: Movie
    var title: String { movie.title }
    var overview: String { movie.overview }
    var voteAverage: String { String(movie.voteAverage) }
    var releaseDateText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: movie.releaseDate)
    }
    var posterUrl: URL? {
        URL(string: "https://image.tmdb.org/t/p/w400\(movie.posterPath)")
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
}

// MARK: - Presenter
protocol MovieDetailPresenterProtocol: AnyObject {
    func load()
}

protocol MovieDetailViewProtocol: AnyObject {
    func update(_ presentation: MovieDetailPresentation)
}
