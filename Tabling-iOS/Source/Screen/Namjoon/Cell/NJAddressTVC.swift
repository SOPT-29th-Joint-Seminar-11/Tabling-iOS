//
//  NamjoonTVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

class NJAddressTVC: UITableViewCell, UITableViewRegisterable {
    
    var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .bold, size: 15)
        label.text = "마포구 연남동 123"
        return label
    }()
    
    var addressIconImageView: UIImageView = {
        let img = UIImageView()
        img.image = Const.Icon.chevronDown
        return img
    }() 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(addressLabel)
        contentView.addSubview(addressIconImageView)
        
        addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 125).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        addressIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        addressIconImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -96).isActive = true
        addressIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        addressIconImageView.heightAnchor.constraint(equalTo: addressIconImageView.widthAnchor, multiplier: 1).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressIconImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
