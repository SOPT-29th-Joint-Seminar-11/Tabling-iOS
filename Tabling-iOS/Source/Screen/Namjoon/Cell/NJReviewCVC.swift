//
//  NJReviewCVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/22.
//

import UIKit

class NJReviewCVC: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    var reviewStoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .bold, size: 14)
        return label
    }()
    
    var reviewCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 12)
        label.textColor = .gray
        return label
    }()
    
    var reviewLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 12)
        label.textColor = .gray
        return label
    }()
    
    var reviewStarImageView: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    var reviewScoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 15)
        return label
    }()
    
    var reviewFromHereLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 13)
        label.textColor = .gray
        return label
    }()
    
    var reviewImageView: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    var reviewDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 13)
        label.numberOfLines = 2
        return label
    }()
    
    var reviewFromNowLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 12)
        label.textColor = .gray
        return label
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
    
    func setData(name: String, category: String, location: String, reviewCount: Int, fromHere: Int, imageName: String, description: String, fromNow: String) {
        reviewStoreLabel.text = name
        reviewCategoryLabel.text = "\(category) •"
        reviewLocationLabel.text = location
        switch reviewCount {
        case 1:
            reviewStarImageView.image = Const.Icon.oneStar
        case 2:
            reviewStarImageView.image = Const.Icon.twoStar
        case 3:
            reviewStarImageView.image = Const.Icon.threeStar
        case 4:
            reviewStarImageView.image = Const.Icon.fourStar
        case 5:
            reviewStarImageView.image = Const.Icon.fiveStar
        default:
            reviewStarImageView.image = Const.Icon.star
        }
        reviewScoreLabel.text = String(reviewCount) + ".0"
        reviewFromHereLabel.text = String(fromHere) + "km"
        if let image = UIImage(named: imageName) {
            reviewImageView.image = image
        }
        reviewDescriptionLabel.text = description
        reviewFromNowLabel.text = fromNow
    }
    
    func setUpAutoLayout() {
        contentView.addSubviews([reviewStoreLabel, reviewCategoryLabel, reviewLocationLabel, reviewStarImageView,
                                 reviewScoreLabel, reviewFromHereLabel, reviewImageView, reviewDescriptionLabel, reviewFromNowLabel])
        
        contentView.backgroundColor = .boxFillGray
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.boxStrokeGray.cgColor
        contentView.layer.cornerRadius = 13
        
        reviewStoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13).isActive = true
        reviewStoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19).isActive = true
        
        reviewCategoryLabel.topAnchor.constraint(equalTo: reviewStoreLabel.bottomAnchor, constant: 0).isActive = true
        reviewCategoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19).isActive = true
        
        reviewLocationLabel.topAnchor.constraint(equalTo: reviewStoreLabel.bottomAnchor, constant: 0).isActive = true
        reviewLocationLabel.leadingAnchor.constraint(equalTo: reviewCategoryLabel.trailingAnchor, constant: 0).isActive = true
        
        reviewStarImageView.topAnchor.constraint(equalTo: reviewCategoryLabel.bottomAnchor, constant: 5).isActive = true
        reviewStarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19).isActive = true
        
        reviewScoreLabel.centerYAnchor.constraint(equalTo: reviewStarImageView.centerYAnchor).isActive = true
        reviewScoreLabel.leadingAnchor.constraint(equalTo: reviewStarImageView.trailingAnchor, constant: 6).isActive = true
        
        reviewFromHereLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        reviewFromHereLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19).isActive = true
        
        reviewImageView.topAnchor.constraint(equalTo: reviewStarImageView.bottomAnchor, constant: 19).isActive = true
        reviewImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        reviewImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        reviewImageView.heightAnchor.constraint(equalToConstant: 134).isActive = true

        reviewDescriptionLabel.topAnchor.constraint(equalTo: reviewImageView.bottomAnchor, constant: 13).isActive = true
        reviewDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19).isActive = true

        reviewFromNowLabel.topAnchor.constraint(equalTo: reviewDescriptionLabel.bottomAnchor, constant: 7).isActive = true
        reviewFromNowLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        [reviewStoreLabel, reviewCategoryLabel, reviewLocationLabel, reviewStarImageView,
         reviewScoreLabel, reviewFromHereLabel, reviewImageView, reviewDescriptionLabel, reviewFromNowLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
