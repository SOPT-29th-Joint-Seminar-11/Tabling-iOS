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
        label.text = "hello" // 위치 테스트용
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(addressLabel)
        
        addressLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 125).isActive = true
        //addressLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 18).isActive = true
        //addressLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 18).isActive = true
        addressLabel.backgroundColor = UIColor.red
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
