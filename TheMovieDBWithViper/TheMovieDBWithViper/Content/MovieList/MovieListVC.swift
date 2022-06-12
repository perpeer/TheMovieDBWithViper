//
//  MovieListVC.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit

final class MovieListVC: BaseVC {
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.showsVerticalScrollIndicator = false
            collectionView.contentInset = .init(top: 8, left: 8, bottom: 8, right: 8)
            collectionView.register(MovieListCell.self)
        }
    }
    // MARK: - UI Properties
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.delegate = self
        controller.searchResultsUpdater = self
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.placeholder = "Search movies..."
        return controller
    }()
    // MARK: - Properties
    private var movies: [MoviePresentation] = []
    var presenter: MovieListPresenterProtocol!
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    override func setupUI() {
        super.setupUI()
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.removeViewController(SplashVC.self)
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension MovieListVC: MovieListViewProtocol {
    func handleOutput(_ output: MovieListPresenterOutput) {
        DispatchQueue.main.async {
            switch output {
            case .updateTitle(let title):
                self.title = title
            case .setLoading(let isLoading):
                UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
            case .showMovieList(let movies):
                self.movies = movies
                self.collectionView.reloadData()
            }
        }
    }
}

extension MovieListVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
}

extension MovieListVC: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        let topInset = collectionView.contentInset.top + view.safeAreaInsets.top
        collectionView.setContentOffset(CGPoint(x: -collectionView.contentInset.left,
                                                y: -topInset), animated: true)
    }
}

extension MovieListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieListCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.movie = movies[indexPath.item]
        return cell
    }
}

extension MovieListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.selectMovie(at: indexPath.item)
    }
}

extension MovieListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 24) / 2
        let height = width * 1.43
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
}
