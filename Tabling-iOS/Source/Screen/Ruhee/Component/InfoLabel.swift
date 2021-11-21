//
//  InfoLabel.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/20.
//

import UIKit

import SnapKit

class InfoLabel: UILabel {
    
    // MARK: - Initializing

    init(title: String) {
        super.init(frame: .zero)
        configUI(title: title)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI + Layout
    
    private func configUI(title: String) {
        text = title
        textColor = .gray3
        font = UIFont.noto(type: .regular, size: 15)
    }
    
    private func setupAutoLayout() {
        self.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
    }
}
