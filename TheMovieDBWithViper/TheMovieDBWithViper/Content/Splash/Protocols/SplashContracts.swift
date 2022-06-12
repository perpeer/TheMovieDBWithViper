//
//  SplashContracts.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import Foundation

// MARK: - Presenter
protocol SplashPresenterProtocol: AnyObject {
    var router: SplashRouterProtocol { get set }
}

// MARK: - Router
enum SplashRoute {
    case movieList
}

protocol SplashRouterProtocol: AnyObject {
    func navigate(to route: SplashRoute)
}
