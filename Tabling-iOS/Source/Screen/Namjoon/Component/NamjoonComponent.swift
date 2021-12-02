//
//  NamjoonComponent.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit
import CoreMedia

class NamjoonComponent: UIView {
    
    // MARK: - Properties
    
    private let tablingIconImageView: UIImageView = {
        let img = UIImageView()
        img.image = Const.Icon.logo
        return img
    }()
    
    private let tablingSearchTextField = UITextField()
    
    private let tablingSearchButton: UIImageView = {
        let img = UIImageView()
        img.image = Const.Icon.search
        return img
    }()
    
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
        tablingSearchTextField.attributedPlaceholder = NSAttributedString(string: "지역/음식종류/레스토랑 검색", attributes: [NSAttributedString.Key.font: UIFont.noto(type: .regular, size: 14)])
    }
    
    func setupAutoLayout() {
        addSubviews([tablingIconImageView, tablingSearchTextField, tablingSearchButton])
        
        tablingIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        tablingIconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        tablingIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        tablingIconImageView.heightAnchor.constraint(equalTo: tablingIconImageView.widthAnchor, multiplier: 1).isActive = true
        
        tablingSearchTextField.topAnchor.constraint(equalTo: topAnchor, constant: 19).isActive = true
        tablingSearchTextField.leftAnchor.constraint(equalTo: tablingIconImageView.rightAnchor, constant: 0).isActive = true
        tablingSearchTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -19).isActive = true
        tablingSearchTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -29).isActive = true
        
        tablingSearchButton.topAnchor.constraint(equalTo: tablingSearchTextField.topAnchor).isActive = true
        tablingSearchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -33).isActive = true
        tablingSearchButton.bottomAnchor.constraint(equalTo: tablingSearchTextField.bottomAnchor).isActive = true
        tablingSearchButton.heightAnchor.constraint(equalTo: tablingSearchButton.widthAnchor, multiplier: 1).isActive = true
        
        [tablingIconImageView, tablingSearchTextField, tablingSearchButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

// MARK: - AddPadding

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
