//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Kembly Muñoz valencia on 14/9/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
}
