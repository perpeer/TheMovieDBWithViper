//
//  MovieListContracts.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import Foundation
import struct NetworkLayer.Movie

// MARK: - Presentation
final class MoviePresentation {
    private let movie: Movie
    var title: String { movie.title }
    var voteAverage: String { String(movie.voteAverage) }
    var posterUrl: URL? {
        URL(string: "https://image.tmdb.org/t/p/w400\(movie.posterPath)")
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
}

// MARK: - Interactor
protocol MovieListInteractorProtocol: AnyObject {
    var delegate: MovieListInteractorDelegate? { get set }
    func load()
    func selectMovie(at index: Int)
}

enum MovieListInteractorOutput {
    case setLoading(Bool)
    case showMovieList([Movie])
    case showMovieDetail(Movie)
}

protocol MovieListInteractorDelegate: AnyObject {
    func handleOutput(_ output: MovieListInteractorOutput)
}

// MARK: - Presenter
protocol MovieListPresenterProtocol: AnyObject {
    func load()
    func selectMovie(at index: Int)
}

enum MovieListPresenterOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MoviePresentation])
}

// MARK: - View
protocol MovieListViewProtocol: AnyObject {
    func handleOutput(_ output: MovieListPresenterOutput)
}
// MARK: - Router
enum MovieListRoute {
    case detail(Movie)
}

protocol MovieListRouterProtocol: AnyObject {
    func navigate(to route: MovieListRoute)
}
