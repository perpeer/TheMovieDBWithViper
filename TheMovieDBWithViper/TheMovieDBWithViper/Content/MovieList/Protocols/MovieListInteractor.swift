//
//  MovieListInteractor.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import Foundation
import protocol NetworkLayer.ServiceProtocol
import struct NetworkLayer.Movie
import struct NetworkLayer.PopularMovieListResponse

final class MovieListInteractor: MovieListInteractorProtocol {
    private let service: ServiceProtocol
    private var movies: [Movie] = []
    weak var delegate: MovieListInteractorDelegate?
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func load() {
        delegate?.handleOutput(.setLoading(true))
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=fa1a04fcea20f70930511913b74bbf7e")
        service.fetchResponse(of: PopularMovieListResponse.self, from: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.delegate?.handleOutput(.setLoading(false))
                self.movies = response.results
                self.delegate?.handleOutput(.showMovieList(response.results))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectMovie(at index: Int) {
        let movie = movies[index]
        delegate?.handleOutput(.showMovieDetail(movie))
    }
}
