//
//  UIStackView+.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/14.
//

import UIKit

extension UIStackView {
    
    public func addArrangedSubviews(_ view: [UIView]) {
        view.forEach{ self.addArrangedSubview($0) }
    }
}
