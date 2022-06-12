//
//  MovieListRouter.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit

final class MovieListRouter: MovieListRouterProtocol {
    let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: MovieListRoute) {
        switch route {
        case .detail(let movie):
            let detailView = MovieDetailBuilder.make(with: movie)
            view.show(detailView, sender: nil)
        }
    }
}
