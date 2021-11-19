//
//  LineView.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

class LineView: UIView {
       
    // MARK: - Initializing

    init(color: UIColor, height: CGFloat) {
        super.init(frame: .zero)
        configUI(color: color)
        setupAutoLayout(height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI + Layout
    
    private func configUI(color: UIColor) {
        backgroundColor = color
    }
    
    private func setupAutoLayout(height: CGFloat) {
        self.snp.makeConstraints { make in
            make.height.equalTo(height)
        }
    }
}
