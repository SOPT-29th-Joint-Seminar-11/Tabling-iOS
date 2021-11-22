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
        return img
    }()
    
    var cafeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 15)
        return label
    }()
    
    var cafeScore: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 13)
        label.textColor = .red
        return label
    }()
    
    var cafeReviewCount: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .medium, size: 13)
        return label
    }()
    
    var cafeCategory: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .regular, size: 13)
        label.textColor = UIColor.gray
        return label
    }()
    
    var cafeLocation: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .regular, size: 13)
        label.textColor = UIColor.gray
        return label
    }()
    
    var cafeFunction = UIStackView()
}
