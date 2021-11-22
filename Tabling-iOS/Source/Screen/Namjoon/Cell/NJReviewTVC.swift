//
//  NJReviewTVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/21.
//

import UIKit

class NJReviewTVC: UITableViewCell, UITableViewRegisterable {
    
    var reviewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .bold, size: 17)
        label.text = "테이블링 Best 리뷰"
        return label
    }()
    
    var reviewCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .orange
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(reviewTitleLabel)
        contentView.addSubview(reviewCV)
        
        reviewTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        reviewTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        reviewCV.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        reviewCV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -23).isActive = true
        
        reviewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewCV.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
