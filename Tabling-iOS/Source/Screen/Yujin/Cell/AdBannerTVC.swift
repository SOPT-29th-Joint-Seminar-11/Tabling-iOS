//
//  AdBannerTVC.swift
//  Tabling-iOS
//
//  Created by 이유진 on 2021/11/26.
//

import UIKit

class AdBannerTVC: UITableViewCell {
    static let identifier = "AdBannerTVC"
    
    var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "img_rooftop")
        return imageView
    }()
    
    var line = LineView(color: .main , height: 1.0)
    
    var titleLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .bold, size: 17)
        label.textColor = .white
        return label
    }()
    
    var subTitleLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .regular, size: 14)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupAutoLayout() {
        contentView.addSubviews([backgroundImage,line,titleLabel
                                 ,subTitleLabel])
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        line.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 26).isActive = true
        line.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 26).isActive = true
        line.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 31).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor,constant: 24).isActive = true
       
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
    }
    
    func setData(bannerData: AdBannerModel){
        backgroundImage.image = bannerData.image
        titleLabel.text = bannerData.title
        subTitleLabel.text = bannerData.subTitle
    }
}

