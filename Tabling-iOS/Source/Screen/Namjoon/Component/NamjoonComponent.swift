//
//  NamjoonComponent.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import Foundation
import UIKit
import Then

class NamjoonComponent: UIView {
    
    private let tablingIconImageView: UIImageView = {
        let img = UIImageView()
        img.image = Const.Icon.logo
        return img
    }()
    
    private let tablingSearchTextField = UITextField()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    func configUI() {
        backgroundColor = .white
        
        tablingSearchTextField.addLeftPadding(width: 20)
        tablingSearchTextField.addRightPadding(width: 20)
        tablingSearchTextField.layer.cornerRadius = 25
        tablingSearchTextField.layer.borderWidth = 1
        tablingSearchTextField.layer.borderColor = UIColor.gray.cgColor
        tablingSearchTextField.placeholder = "지역/음식종류/레스토랑 검색"
    }
    
    func setupAutoLayout() {
//        addSubviews([tablingIconImageView, tablingSearchImageView])
        addSubviews([tablingIconImageView, tablingSearchTextField])
        
        tablingIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        tablingIconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        tablingIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        tablingIconImageView.heightAnchor.constraint(equalTo: tablingIconImageView.widthAnchor, multiplier: 1).isActive = true
        
        tablingSearchTextField.topAnchor.constraint(equalTo: topAnchor, constant: 19).isActive = true
        tablingSearchTextField.leftAnchor.constraint(equalTo: tablingIconImageView.rightAnchor, constant: 0).isActive = true
        tablingSearchTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -19).isActive = true
        tablingSearchTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -29).isActive = true
        
        tablingIconImageView.translatesAutoresizingMaskIntoConstraints = false
        tablingSearchTextField.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UITextField {
    func addLeftPadding(width: CGFloat = 14) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func addRightPadding(width: CGFloat = 14) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
