//
//  StoreCVC.swift
//  Tabling-iOS
//
//  Created by 이유진 on 2021/11/22.
//

import UIKit

class StoreCVC: UICollectionViewCell {
    static let identifier = "StoreCVC"
    
    var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_uni")
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .medium, size: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Const.Icon.starFill
        return imageView
    }()
    
    var ratingLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .medium, size: 13)
        label.textColor = UIColor.main
        return label
    }()
    
    var numOfReviewLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .medium, size: 13)
        label.textColor = UIColor.black
        return label
    }()
    
    var categoryLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .regular, size: 13)
        label.textColor = UIColor.gray
        return label
    }()
    
    var optionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 4.0
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupAutoLayout() {
        contentView.addSubviews([thumbnailImageView,nameLabel,starImageView,
                                 ratingLabel,numOfReviewLabel,categoryLabel,
                                 optionStackView])
 
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        numOfReviewLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        optionStackView.translatesAutoresizingMaskIntoConstraints = false
        
        thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        thumbnailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor,constant: 9).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 4).isActive = true
       
        starImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 4).isActive = true
        starImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 4).isActive = true
        
        ratingLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor,constant: 4).isActive = true
        ratingLabel.centerYAnchor.constraint(equalTo: starImageView.centerYAnchor).isActive = true
        
        numOfReviewLabel.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor,constant: 4).isActive = true
        numOfReviewLabel.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor).isActive = true
        
        categoryLabel.leadingAnchor.constraint(equalTo: numOfReviewLabel.trailingAnchor,constant: 4).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: numOfReviewLabel.centerYAnchor).isActive = true
        
        optionStackView.topAnchor.constraint(equalTo: starImageView.bottomAnchor,constant: 17).isActive = true
        optionStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 3).isActive = true
        optionStackView.widthAnchor.constraint(equalToConstant: 116).isActive = true
        optionStackView.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        optionStackView.backgroundColor = .gray
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    func setData(storeData: StoreModel){
        nameLabel.text = storeData.storeName
        ratingLabel.text = String(storeData.rating)
        numOfReviewLabel.text = "("+String(storeData.numOfReview)+")"
        categoryLabel.text = storeData.category + "·" + storeData.area
        
    }
    
}
