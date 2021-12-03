//
//  FacilityCardView.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/20.
//

import UIKit

import SnapKit
import Then

class FacilityCardView: UIView {

    // MARK: - Properties
    
    private var networkMG = DetailManager.shared
    
    var hiddenNum: Int?
    
    private lazy var iconStackView = UIStackView().then {
        $0.axis = .vertical
        $0.addArrangedSubviews([iconImageView, iconLabel])
    }
    
    private let iconImageView = UIImageView()
    
    private let iconLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = UIFont.noto(type: .medium, size: 11)
        $0.textColor = .gray3
    }

    // MARK: - Initializing

    init(image: UIImage, title: String, space: CGFloat, hidden: Int?) {
        super.init(frame: .zero)
        configUI(image: image, title: title, space: space)
        setupAutoLayout()
        self.hiddenNum = hidden
        if hiddenNum == 0 {
            self.isHidden = true
        } else if hiddenNum == 1 {
            self.isHidden = false
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI + Layout
    
    private func configUI(image: UIImage?, title: String, space: CGFloat) {
        layer.cornerRadius = 5
        layer.borderColor = UIColor.gray2.cgColor
        layer.borderWidth = 1
        
        iconStackView.spacing = space
        iconImageView.image = image
        iconLabel.text = title
    }
    
    private func setupAutoLayout() {
        addSubviews([iconImageView, iconLabel])
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(7)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(48)
        }
        
        iconLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.height.equalTo(11)
        }
    }
}

