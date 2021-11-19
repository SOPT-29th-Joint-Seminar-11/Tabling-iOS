//
//  SubtitlLabel.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

class SubtitlLabel: UILabel {

    init(title: String) {
        super.init(frame: .zero)
        configUI(title: title)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI(title: String) {
        text = title
        textColor = .black
        font = UIFont.noto(type: .bold, size: 16)
    }
    
    private func setupAutoLayout() {
        self.snp.makeConstraints { make in
            make.height.equalTo(23)
        }
    }
}
