//
//  TitleTVC.swift
//  Tabling-iOS
//
//  Created by 이유진 on 2021/11/22.
//

import UIKit

class TitleTVC: UITableViewCell {
    static let identifier = "TitleTVC"
    
    var titleLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.noto(type: .bold, size: 17)
        label.textColor = UIColor.black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupAutoLayout() {
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    }
    
    func setData(titleData: TitleModel, index: Int){
        titleLabel.text = titleData.titles[index]
    }

}
