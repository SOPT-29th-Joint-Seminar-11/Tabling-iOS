//
//  NJBannerTVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/21.
//

import UIKit

class NJBannerTVC: UITableViewCell, UITableViewRegisterable {
    
    var bannerImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "img_rooftop")
        return img
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(bannerImageView)
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9).isActive = true
        bannerImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        bannerImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -9).isActive = true
        bannerImageView.heightAnchor.constraint(equalToConstant: 150.8).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
