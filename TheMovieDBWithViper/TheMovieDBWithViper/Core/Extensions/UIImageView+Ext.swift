//
//  UIImageView+Ext.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit

extension UIImageView {
    func loadFrom(url: URL?) {
        guard image == nil, let url = url else {
            return
        }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
}
