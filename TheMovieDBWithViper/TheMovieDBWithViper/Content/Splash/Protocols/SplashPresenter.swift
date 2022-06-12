//
//  SplashPresenter.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 12.06.2022.
//

import Foundation

final class SplashPresenter: SplashPresenterProtocol {
    var router: SplashRouterProtocol
        
    init(router: SplashRouterProtocol) {
        self.router = router
    }
}
