//
//  NJStoreTVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/21.
//

import UIKit

class NJStoreTVC: UITableViewCell, UITableViewRegisterable {
    
    var storeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .bold, size: 17)
        label.text = "핫한 맛집, 지금 바로 입장하세요!"
        return label
    }()
    
    var storeCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .orange
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(storeTitleLabel)
        contentView.addSubview(storeCV)
        
        storeTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        storeTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
//        cafeCV.topAnchor.constraint(equalTo: cafeTitleLabel.bottomAnchor, constant: 14).isActive = true
        storeCV.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        storeCV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -23).isActive = true
        
        storeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        storeCV.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
