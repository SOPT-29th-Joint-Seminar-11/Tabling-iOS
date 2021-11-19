//
//  ButtonStackView.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

import SnapKit
import Then

class ButtonStackView: UIStackView {
    
    // MARK: - Properties
    
    let menuButton = UIButton()
    
    let menuLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont.noto(type: .regular, size: 11)
        $0.textColor = .gray3
    }

    // MARK: - Initializing

    init(image: UIImage, title: String, space: CGFloat) {
        super.init(frame: .zero)
        configUI(image: image, title: title, space: space)
        setupAutoLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI + Layout
    
    private func configUI(image: UIImage?, title: String, space: CGFloat) {
        axis = .vertical
        spacing = space
        menuButton.setImage(image, for: .normal)
        menuLabel.text = title
        addArrangedSubviews([menuButton, menuLabel])
    }
    
    private func setupAutoLayout() {
        menuButton.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.height.equalTo(28)
        }
        
        menuLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}
