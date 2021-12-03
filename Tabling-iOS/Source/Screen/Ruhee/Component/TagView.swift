//
//  TagView.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/20.
//

import UIKit

import SnapKit
import Then

class TagView: UIView {
    
    // MARK: - Properties
    
    let tagLabel = UILabel().then {
        $0.font = UIFont.noto(type: .regular, size: 13)
        $0.textColor = .black
    }
    
    // MARK: - Initializing

    init(tag: String) {
        super.init(frame: .zero)
        configUI(tag: tag)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI + Layout
    
    private func configUI(tag: String) {
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.main.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 16
        tagLabel.text = tag
    }
    
    private func setupAutoLayout() {
        self.addSubview(tagLabel)
        
        self.snp.makeConstraints { make in
            make.height.equalTo(32)
        }
        
        tagLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(11)
            make.center.equalToSuperview()
        }
    }
}
