//
//  BottomView.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

import SnapKit
import Then

class BottomView: UIView {
    
    // MARK: - Properties
    
    private let lineView = UIView().then {
        $0.backgroundColor = .headerLineGray
    }
    
    private lazy var buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 13
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.addArrangedSubviews([leftButton, rightButton])
    }
    
    private let leftButton = UIButton().then {
        $0.layer.cornerRadius = 5
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.main.cgColor
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("원격줄서기", for: .normal)
        $0.titleLabel!.font = UIFont.noto(type: .bold, size: 16)
        $0.titleLabel?.addSpacing(kernValue: -0.6, paragraphValue: 0)
    }
    
    private let rightButton = UIButton().then {
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .main
        $0.setTitle("즉시예약", for: .normal)
        $0.titleLabel!.font = UIFont.noto(type: .bold, size: 16)
        $0.titleLabel?.addSpacing(kernValue: -0.6, paragraphValue: 0)
    }
    
    // MARK: Initializing
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI + Layout
    
    private func setupAutoLayout() {
        addSubviews([lineView, buttonStackView])
        
        lineView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        leftButton.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.height.equalTo(53)
        }
        
        rightButton.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.height.equalTo(53)
        }
    }
    
    // MARK: - Custom Method
    
    
}
