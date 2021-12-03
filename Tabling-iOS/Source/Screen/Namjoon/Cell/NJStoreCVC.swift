//
//  NJStoreCVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/22.
//

import UIKit
import Kingfisher

class NJStoreCVC: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
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
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    // setData(storeData: MainData) method overloading
    func setData(storeData: MainData) {
        cafeLabel.text = storeData.name
        switch storeData.groupType {
        case "카페":
            cafeImageView.kf.setImage(with: URL(string: storeData.titleImage))
        default:
            if let image = UIImage(named: storeData.titleImage) {
                cafeImageView.image = image
            }
        }
        cafeScoreLabel.text = String(storeData.rating) + ".0"
        cafeReviewCountLabel.text = "(\(String(storeData.reviewCount)))"
        cafeCategoryLabel.text = "\(storeData.groupType) •"
        cafeLocationLabel.text = storeData.location
        if (storeData.reserveFlag == false) {
            self.canBookNowImage.isHidden = true
            self.cafeFunction.widthAnchor.constraint(equalToConstant: 61).isActive = true
        }
        if (storeData.lineupFlag == false) {
            self.canLineUpImage.isHidden = true
            self.cafeFunction.widthAnchor.constraint(equalToConstant: 51).isActive = true
        }
    }
    
    // setData(storeData: Store) method overloading
    func setData(storeData: Store) {
        cafeLabel.text = storeData.name
        if let image = UIImage(named: storeData.imageLink) {
            cafeImageView.image = image
        }
        cafeScoreLabel.text = String(storeData.score) + ".0"
        cafeReviewCountLabel.text = "(\(String(storeData.reviewCount)))"
        cafeCategoryLabel.text = "\(storeData.category) •"
        cafeLocationLabel.text = storeData.location
        if (storeData.canBookNow == false) {
            self.canBookNowImage.isHidden = true
            self.cafeFunction.widthAnchor.constraint(equalToConstant: 61).isActive = true
        }
        if (storeData.canLineUpNow == false) {
            self.canLineUpImage.isHidden = true
            self.cafeFunction.widthAnchor.constraint(equalToConstant: 51).isActive = true
        }
    }
    
    func setUpAutoLayout() {
        
        contentView.addSubviews([
            cafeImageView, cafeLabel, cafeScoreIcon, cafeScoreLabel,
            cafeReviewCountLabel, cafeCategoryLabel, cafeLocationLabel, cafeFunction
        ])
        
        cafeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        cafeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        cafeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        cafeImageView.heightAnchor.constraint(equalToConstant: 108).isActive = true
        cafeImageView.contentMode = .scaleAspectFill
        
        cafeLabel.topAnchor.constraint(equalTo: cafeImageView.bottomAnchor, constant: 9).isActive = true
        cafeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        cafeLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        cafeScoreIcon.topAnchor.constraint(equalTo: cafeLabel.bottomAnchor, constant: 4).isActive = true
        cafeScoreIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        
        cafeScoreLabel.centerYAnchor.constraint(equalTo: cafeScoreIcon.centerYAnchor).isActive = true
        cafeScoreLabel.leadingAnchor.constraint(equalTo: cafeScoreIcon.trailingAnchor, constant: 4).isActive = true
        
        cafeReviewCountLabel.centerYAnchor.constraint(equalTo: cafeScoreIcon.centerYAnchor).isActive = true
        cafeReviewCountLabel.leadingAnchor.constraint(equalTo: cafeScoreLabel.trailingAnchor, constant: 2).isActive = true
        
        cafeCategoryLabel.centerYAnchor.constraint(equalTo: cafeScoreIcon.centerYAnchor).isActive = true
        cafeCategoryLabel.leadingAnchor.constraint(equalTo: cafeReviewCountLabel.trailingAnchor, constant: 7).isActive = true
        
        cafeLocationLabel.centerYAnchor.constraint(equalTo: cafeScoreIcon.centerYAnchor).isActive = true
        cafeLocationLabel.leadingAnchor.constraint(equalTo: cafeCategoryLabel.trailingAnchor, constant: 5).isActive = true
        
        cafeFunction.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        cafeFunction.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3).isActive = true
        cafeFunction.widthAnchor.constraint(equalToConstant: 117).isActive = true
        cafeFunction.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        [cafeImageView, cafeLabel, cafeScoreIcon, cafeScoreLabel, cafeReviewCountLabel,
         cafeCategoryLabel, cafeLocationLabel, cafeFunction].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
