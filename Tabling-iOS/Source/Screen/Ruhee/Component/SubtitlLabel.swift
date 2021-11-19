//
//  SubtitlLabel.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

import SnapKit

class SubtitlLabel: UILabel {
    
    // MARK: - Initializing

    init(title: String, color: UIColor) {
        super.init(frame: .zero)
        configUI(title: title, color: color)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI + Layout
    
    private func configUI(title: String, color: UIColor) {
        text = title
        textColor = color
        font = UIFont.noto(type: .bold, size: 16)
    }
    
    private func setupAutoLayout() {
        self.snp.makeConstraints { make in
            make.height.equalTo(23)
        }
    }
}
