//
//  MovieDetailPresenter.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import Foundation
import struct NetworkLayer.Movie

final class MovieDetailPresenter: MovieDetailPresenterProtocol {
    private let movie: Movie
    var view: MovieDetailViewProtocol
    
    init(view: MovieDetailViewProtocol, movie: Movie) {
        self.view = view
        self.movie = movie
    }
    
    func load() {
        view.update(MovieDetailPresentation(movie: movie))
    }
}
