//
//  SplashBuilder.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit

final class SplashBuilder {
    static func make() -> SplashVC {
        let view = SplashVC(nibName: "SplashVC", bundle: nil)
        let router = SplashRouter(view: view)
        let presenter = SplashPresenter(router: router)
        view.presenter = presenter
        return view
    }
}
