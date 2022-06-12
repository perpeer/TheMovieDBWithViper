//
//  SplashRouter.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import Foundation
import UIKit

final class SplashRouter: SplashRouterProtocol {
    let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: SplashRoute) {
        switch route {
        case .movieList:
            let view = MovieListBuilder.make()
            self.view.show(view, sender: nil)
        }
    }
}
