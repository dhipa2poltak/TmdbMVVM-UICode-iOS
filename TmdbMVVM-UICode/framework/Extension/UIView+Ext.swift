//
//  UIView+Ext.swift
//  TmdbMVVM-UICode
//
//  Created by user on 07/03/23.
//

import Foundation
import UIKit

extension UIView {
    func addConstrainedSubView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }

    func addConstrainedSubViews(_ views: UIView...) {
        views.forEach { view in addConstrainedSubView(view) }
    }
}
