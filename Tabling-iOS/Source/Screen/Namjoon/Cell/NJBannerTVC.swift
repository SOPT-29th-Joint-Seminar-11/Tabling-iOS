//
//  NJBannerTVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/21.
//

import UIKit

class NJBannerTVC: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - Properties
    
    var bannerImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "img_rooftop")
        return img
    }()
    
    var line = LineView(color: .main , height: 1.0)
    
    var bannerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .bold, size: 17)
        label.textColor = .white
        label.text = "분위기 깡패 루프탑, 테라스 맛집!"
        return label
    }()
    
    var bannerDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .regular, size: 14)
        label.textColor = .white
        label.text = "맛과 멋을 즐길 수 있는 곳"
        return label
    }()

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    func setUpAutoLayout() {
        contentView.addSubviews([bannerImageView, line, bannerTitleLabel, bannerDescriptionLabel])
        
        bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 31).isActive = true
        bannerImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -9).isActive = true
        
        line.topAnchor.constraint(equalTo: bannerImageView.topAnchor, constant: 26).isActive = true
        line.leadingAnchor.constraint(equalTo: bannerImageView.leadingAnchor, constant: 26).isActive = true
        line.trailingAnchor.constraint(equalTo: bannerImageView.trailingAnchor, constant: -283).isActive = true
        
        bannerTitleLabel.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 6).isActive = true
        bannerTitleLabel.leadingAnchor.constraint(equalTo: line.leadingAnchor).isActive = true
        
        bannerDescriptionLabel.topAnchor.constraint(equalTo: bannerTitleLabel.bottomAnchor, constant: 3).isActive = true
        bannerDescriptionLabel.leadingAnchor.constraint(equalTo: line.leadingAnchor).isActive = true
        
        [bannerImageView, line, bannerTitleLabel, bannerDescriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
