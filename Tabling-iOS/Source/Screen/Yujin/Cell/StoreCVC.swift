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
    
    var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Const.Tag.book
        return imageView
    }()
    
    var lineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Const.Tag.line
        return imageView
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
                                 bookImageView,lineImageView])
 
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        starImageView.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        numOfReviewLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        lineImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
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
        
        bookImageView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 14).isActive = true
        bookImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3).isActive = true
        
        lineImageView.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 14).isActive = true
        lineImageView.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 4).isActive = true
        
        
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
        
        switch(storeData.option){
        case [true,false]:
            lineImageView.isHidden = true
        case [false,true]:
            bookImageView.isHidden = true
            lineImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3).isActive = true
        case [false,false]:
            bookImageView.isHidden = true
            lineImageView.isHidden = true
        default :
            bookImageView.isHidden = false
            lineImageView.isHidden = false
            
        }
        
    }
    
    func setOptionTag(){
        
    }
    
}
