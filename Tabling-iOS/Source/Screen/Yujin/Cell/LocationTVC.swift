//
//  LocationTVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/20.
//

import UIKit

class LocationTVC: UITableViewCell {
    
    static let identifier = "LocationTVC"
    
    var locationLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .bold, size: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    var locationButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(Const.Icon.chevronDown, for: UIControl.State.normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupAutoLayout() {
        contentView.addSubview(locationLabel)
        contentView.addSubview(locationButton)
        
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        locationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 125).isActive = true
        
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        
        locationButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        locationButton.leadingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant:106).isActive = true
        locationButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        locationButton.heightAnchor.constraint(equalTo: locationButton.widthAnchor,multiplier: 1).isActive = true
        
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(locationData: LocationModel){
        locationLabel.text = locationData.location
    }

}
