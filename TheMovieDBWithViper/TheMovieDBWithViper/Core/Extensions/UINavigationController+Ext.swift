//
//  UINavigationController+Ext.swift
//  TheMovieDBWithViper
//
//  Created by Ekrem TAŞKIRAN on 11.06.2022.
//

import UIKit

extension UINavigationController {
    func removeViewController(_ controller: UIViewController.Type) {
        if let viewController = viewControllers.first(where: { $0.isKind(of: controller.self) }) {
            viewController.removeFromParent()
        }
    }
}
