//
//  ReviewCVC.swift
//  Tabling-iOS
//
//  Created by 이유진 on 2021/11/26.
//

import UIKit

class ReviewCVC: UICollectionViewCell {
    static let identifier = "ReviewCVC"
    
    
    var nameLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .medium, size: 15)
        label.textColor = .black
        return label
    }()
    
    var categoryLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .regular, size: 13)
        label.textColor = .gray
        return label
    }()
    
    var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Const.Icon.fiveStar
        return imageView
    }()
    
    var ratingLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .medium, size: 13)
        label.textColor = .black
        return label
    }()
    
    var distanceLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .medium, size: 13)
        label.textColor = .gray
        return label
    }()
    
    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_italy")
        return imageView
    }()
    
    
    var reviewLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .medium, size: 13)
        label.textColor = .gray3
        return label
    }()
    
    var uploadTimeLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .regular, size: 13)
        label.textColor = .gray
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupAutoLayout() {
        contentView.addSubviews([nameLabel,categoryLabel,starImageView,
                                ratingLabel,distanceLabel,photoImageView,
                                 reviewLabel,uploadTimeLabel])
 
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        uploadTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 13).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 19).isActive = true
        
        categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
  
        starImageView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor,constant: 5).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor).isActive = true
        
        ratingLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor,constant: 6).isActive = true
        ratingLabel.centerYAnchor.constraint(equalTo: starImageView.centerYAnchor).isActive = true
        
        distanceLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 14).isActive = true
        distanceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 19).isActive = true
        
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 0).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 0).isActive = true
        photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        reviewLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor,constant: 13).isActive = true
        reviewLabel.leadingAnchor.constraint(equalTo: starImageView.leadingAnchor).isActive = true
        
        uploadTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20).isActive = true
        uploadTimeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 16).isActive = true
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = .
        self.backgroundColor = .boxFillGray

        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    func setData(reviewData: ReviewModel){
        nameLabel.text = reviewData.storeName
        categoryLabel.text = reviewData.category + "·" + reviewData.area
        starImageView.image = reviewData.starImage
        ratingLabel.text = String(reviewData.rating)
        distanceLabel.text = String(reviewData.distance) + "km"
        photoImageView.image = reviewData.photo
        reviewLabel.text = reviewData.review
        uploadTimeLabel.text = reviewData.uploadTime + " 전"
        
        
    }
    
}
