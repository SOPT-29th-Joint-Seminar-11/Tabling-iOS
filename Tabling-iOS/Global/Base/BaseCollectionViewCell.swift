//
//  BaseCollectionViewCell.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/14.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: Initializing
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Method
    
    func configUI() {
        // Override ConfigUI
    }
    
    func setupAutoLayout() {
        // Override Layout
    }
}
