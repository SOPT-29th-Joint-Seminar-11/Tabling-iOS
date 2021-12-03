//
//  NamjoonTVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

class NJAddressTVC: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - Properties
    
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
    
    var line = LineView(color: .headerLineGray, height: 1.0)
    
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
        contentView.addSubviews([addressLabel, addressIconImageView, line])
        
        contentView.backgroundColor = .white
        
        addressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 125).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        addressIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        addressIconImageView.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor, constant: -10).isActive = true
        addressIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        addressIconImageView.heightAnchor.constraint(equalTo: addressIconImageView.widthAnchor, multiplier: 1).isActive = true
        
        line.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        line.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        [addressLabel, addressIconImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
