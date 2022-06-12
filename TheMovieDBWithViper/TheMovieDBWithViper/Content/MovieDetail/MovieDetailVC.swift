//
//  MovieDetailVC.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit

final class MovieDetailVC: BaseVC {
    // MARK: - IBOutlets
    @IBOutlet private weak var stackViewContainer: UIStackView!
    @IBOutlet private weak var imageViewPoster: UIImageView!
    @IBOutlet private weak var labelReleaseDateText: UILabel!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelOverviewText: UILabel!
    @IBOutlet private weak var labelVoteAverage: UILabel!
    // MARK: - Properties
    var presenter: MovieDetailPresenterProtocol!
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
}

extension MovieDetailVC: MovieDetailViewProtocol {
    func update(_ presentation: MovieDetailPresentation) {
        labelTitle.text = presentation.title
        labelVoteAverage.text = presentation.voteAverage
        labelOverviewText.text = presentation.overview
        labelReleaseDateText.text = presentation.releaseDateText
        imageViewPoster.loadFrom(url: presentation.posterUrl)
    }
}
