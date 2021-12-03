//
//  SearchHeader.swift
//  Tabling-iOS
//
//  Created by 이유진 on 2021/11/22.
//

import UIKit

class SearchHeader: UITableViewHeaderFooterView {

    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Const.Icon.logo
        return imageView
    }()
    
    let searchTextField: UITextField = {
        let textfield = UITextField()
        textfield.addLeftPadding(width: 20)
        textfield.addRightPadding(width: 20)
        textfield.placeholder = "지역/음식종류/레스토랑 검색"
        textfield.font = UIFont.noto(type: .regular, size: 14)
        return textfield
    }()
    
    let searchIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Const.Icon.search
        return imageView
    }()
    
    override init(reuseIdentifier: String?){
        super .init(reuseIdentifier: reuseIdentifier)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAutoLayout(){
        
        contentView.addSubviews([logoImage,searchTextField,searchIconImage])
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchIconImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                   logoImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16),
                   logoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 12),
                   logoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -16),
                   logoImage.widthAnchor.constraint(equalTo: logoImage.heightAnchor, multiplier: 1.0),
               
                   searchTextField.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor,
                          constant: 1),
                   searchTextField.trailingAnchor.constraint(equalTo:
                                                                contentView.trailingAnchor,constant: -29),
                   searchTextField.heightAnchor.constraint(equalToConstant: 48),
                   searchTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                   
                   searchIconImage.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor,constant: -2),
                   searchIconImage.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor)
               ])
        
        searchTextField.layer.borderColor = UIColor.gray.cgColor
        searchTextField.layer.borderWidth = 1.0
        searchTextField.layer.cornerRadius = 25
    }
}
