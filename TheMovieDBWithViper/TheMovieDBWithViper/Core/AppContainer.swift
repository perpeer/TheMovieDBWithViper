//
//  AppContainer.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit
import class NetworkLayer.Service

let app = AppContainer()

final class AppContainer {
    private(set) var router: AppRouter!
    let service = Service()
    
    func setRouter(window: UIWindow?) {
        self.router = AppRouter(window: window)
    }
}
