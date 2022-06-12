//
//  MovieListCell.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit

final class MovieListCell: BaseCollectionCell {
    // MARK: - IBOutlets
    @IBOutlet private weak var imageViewPoster: UIImageView!
    @IBOutlet private weak var viewTitleBackground: UIView!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelVoteAverage: UILabel!
    // MARK: - Properties
    var movie: MoviePresentation? {
        didSet {
            updateUI()
        }
    }
    // MARK: - Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        viewTitleBackground.backgroundColor = .black.withAlphaComponent(0.75)
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    override func updateUI() {
        super.updateUI()
        guard let movie = movie else {
            return
        }
        labelTitle.text = movie.title
        labelVoteAverage.text = movie.voteAverage
        imageViewPoster.loadFrom(url: movie.posterUrl)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        labelTitle.text = nil
        labelVoteAverage.text = nil
        imageViewPoster.image = nil
    }
}
