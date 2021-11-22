//
//  NJCafeTVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/21.
//

import UIKit

class NJCafeTVC: UITableViewCell, UITableViewRegisterable {
    
    var cafeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .bold, size: 17)
        label.text = "디저트가 맛있는 카페"
        return label
    }()
    
    var cafeCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .orange
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cafeTitleLabel)
        contentView.addSubview(cafeCV)
        
        cafeTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        cafeTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
//        cafeCV.topAnchor.constraint(equalTo: cafeTitleLabel.bottomAnchor, constant: 14).isActive = true
        cafeCV.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        cafeCV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -23).isActive = true
        
        cafeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cafeCV.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
