//
//  MovieListBuilder.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit

final class MovieListBuilder {
    static func make() -> MovieListVC {
        let view = MovieListVC(nibName: "MovieListVC", bundle: nil)
        let router = MovieListRouter(view: view)
        let interactor = MovieListInteractor(service: app.service)
        let presenter = MovieListPresenter(view: view,
                                           interactor: interactor,
                                           router: router)
        view.presenter = presenter
        return view
    }
}
