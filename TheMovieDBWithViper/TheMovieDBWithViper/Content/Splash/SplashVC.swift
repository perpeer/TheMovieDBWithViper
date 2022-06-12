//
//  SplashVC.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit
import NetworkLayer

final class SplashVC: BaseVC {
    // MARK: - Properties
    var presenter: SplashPresenterProtocol!
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.presenter.router.navigate(to: .movieList)
        }
    }
}
