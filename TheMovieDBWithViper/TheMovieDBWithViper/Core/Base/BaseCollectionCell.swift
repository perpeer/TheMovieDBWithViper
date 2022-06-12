//
//  BaseCollectionCell.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell, ReusableView, NibLoadableView {
 
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Customize your layouts
    func setupUI() {
        
    }
    
    // MARK: - Redraw your specific layouts
    func updateUI() {
        
    }
}
