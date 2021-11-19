//
//  ButtonStackView.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

import SnapKit

class ButtonStackView: UIStackView {
    
    // MARK: - Properties
    
    let iconImageView = UIImageView().then {
        $0.image = Const.Icon.map
    }
    
    let menuLabel = UILabel().then {
        $0.text = "위치"
        $0.font = UIFont.noto(type: .regular, size: 11)
    }

    // MARK: - Initializing

    init(image: String, title: String, space: CGFloat) {
        super.init(frame: .zero)
        configUI(space: space)
        setupAutoLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI + Layout
    
    private func configUI(space: CGFloat) {
        axis = .vertical
        spacing = space
        distribution = .fillEqually
        addArrangedSubviews([iconImageView, menuLabel])
    }
    
    private func setupAutoLayout() {
        iconImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        menuLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}
