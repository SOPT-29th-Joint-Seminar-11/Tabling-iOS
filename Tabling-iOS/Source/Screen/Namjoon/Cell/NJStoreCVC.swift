//
//  NJStoreCVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/22.
//

import UIKit

class NJStoreCVC: UICollectionViewCell, UICollectionViewRegisterable {
    
    var cafeImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "image_main")
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        return img
    }()
    
    var cafeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 15)
        return label
    }()
    
    var cafeScoreIcon: UIImageView = {
        let img = UIImageView()
        img.image = Const.Icon.starFill
        return img
    }()

    var cafeScoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 13)
        label.textColor = .main
        return label
    }()

    var cafeReviewCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 13)
        return label
    }()

    var cafeCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .regular, size: 13)
        label.textColor = .gray
        return label
    }()

    var cafeLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .regular, size: 13)
        label.textColor = .gray
        return label
    }()

    lazy var canBookNowImage: UIImageView = {
        let img = UIImageView()
        img.image = Const.Tag.book
        return img
    }()

    lazy var canLineUpImage: UIImageView = {
        let img = UIImageView()
        img.image = Const.Tag.line
        return img
    }()

    lazy var cafeFunction: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [canBookNowImage, canLineUpImage])
        stack.axis = .horizontal
        stack.spacing = 8.0
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(name: String, imageName: String, score: Int, reviewCount: Int, category: String, location: String, canBookNow: Bool, canLineUpNow: Bool) {
        cafeLabel.text = name
        if let image = UIImage(named: imageName) {
            cafeImageView.image = image
        }
        cafeScoreLabel.text = String(score) + ".0"
        cafeReviewCountLabel.text = "(\(String(reviewCount)))"
        cafeCategoryLabel.text = "\(category) •"
        cafeLocationLabel.text = location
        if (canBookNow == false) {
            self.canBookNowImage.isHidden = true
            self.cafeFunction.widthAnchor.constraint(equalToConstant: 61).isActive = true
        }
        if (canLineUpNow == false) {
            self.canLineUpImage.isHidden = true
            self.cafeFunction.widthAnchor.constraint(equalToConstant: 51).isActive = true
        }
    }
    
    func setUpAutoLayout() {
        
        self.contentView.addSubviews([
            cafeImageView, cafeLabel, cafeScoreIcon, cafeScoreLabel,
            cafeReviewCountLabel, cafeCategoryLabel, cafeLocationLabel, cafeFunction
        ])
        
        self.cafeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        self.cafeImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        self.cafeImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        self.cafeImageView.heightAnchor.constraint(equalToConstant: 108).isActive = true
        
        self.cafeLabel.topAnchor.constraint(equalTo: self.cafeImageView.bottomAnchor, constant: 9).isActive = true
        self.cafeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4).isActive = true
        self.cafeLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        self.cafeScoreIcon.topAnchor.constraint(equalTo: self.cafeLabel.bottomAnchor, constant: 4).isActive = true
        self.cafeScoreIcon.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 4).isActive = true
        
        self.cafeScoreLabel.topAnchor.constraint(equalTo: self.cafeLabel.bottomAnchor, constant: 0).isActive = true
        self.cafeScoreLabel.leftAnchor.constraint(equalTo: self.cafeScoreIcon.rightAnchor, constant: 4).isActive = true
        self.cafeScoreLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        self.cafeReviewCountLabel.topAnchor.constraint(equalTo: self.cafeLabel.bottomAnchor, constant: 0).isActive = true
        self.cafeReviewCountLabel.leftAnchor.constraint(equalTo: self.cafeScoreLabel.rightAnchor, constant: 2).isActive = true
        
        self.cafeCategoryLabel.topAnchor.constraint(equalTo: self.cafeLabel.bottomAnchor, constant: 1).isActive = true
        self.cafeCategoryLabel.leftAnchor.constraint(equalTo: self.cafeReviewCountLabel.rightAnchor, constant: 7).isActive = true
        self.cafeCategoryLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        self.cafeLocationLabel.topAnchor.constraint(equalTo: self.cafeLabel.bottomAnchor, constant: 1).isActive = true
        self.cafeLocationLabel.leftAnchor.constraint(equalTo: self.cafeCategoryLabel.rightAnchor, constant: 5).isActive = true
        self.cafeLocationLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        self.cafeFunction.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        self.cafeFunction.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 3).isActive = true
        self.cafeFunction.widthAnchor.constraint(equalToConstant: 117).isActive = true
        self.cafeFunction.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        [cafeImageView, cafeLabel, cafeScoreIcon, cafeScoreLabel, cafeReviewCountLabel,
         cafeCategoryLabel, cafeLocationLabel, cafeFunction].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
