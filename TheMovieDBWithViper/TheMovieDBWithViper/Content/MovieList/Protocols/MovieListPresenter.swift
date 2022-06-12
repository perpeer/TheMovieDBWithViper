//
//  MovieListPresenter.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import Foundation

final class MovieListPresenter: MovieListPresenterProtocol {
    private unowned let view: MovieListViewProtocol
    private let interactor: MovieListInteractorProtocol
    private let router: MovieListRouterProtocol
    
    init(view: MovieListViewProtocol,
         interactor: MovieListInteractorProtocol,
         router: MovieListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
    
    func load() {
        view.handleOutput(.updateTitle("Popular Movies"))
        interactor.load()
    }
    
    func selectMovie(at index: Int) {
        interactor.selectMovie(at: index)
    }
}

extension MovieListPresenter: MovieListInteractorDelegate {
    func handleOutput(_ output: MovieListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view.handleOutput(.setLoading(isLoading))
        case .showMovieList(let movies):
            let moviePresantations = movies.map(MoviePresentation.init)
            view.handleOutput(.showMovieList(moviePresantations))
        case .showMovieDetail(let movie):
            router.navigate(to: .detail(movie))
        }
    }
}
