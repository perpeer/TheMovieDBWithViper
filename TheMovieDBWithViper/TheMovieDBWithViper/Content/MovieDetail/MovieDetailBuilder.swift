//
//  MovieDetailBuilder.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit
import struct NetworkLayer.Movie

final class MovieDetailBuilder {
    static func make(with movie: Movie) -> MovieDetailVC {
        let view = MovieDetailVC(nibName: "MovieDetailVC", bundle: nil)
        let presenter = MovieDetailPresenter(view: view, movie: movie)
        view.presenter = presenter
        return view
    }
}
