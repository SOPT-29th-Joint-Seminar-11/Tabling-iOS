//
//  BottomDetailTVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

class BottomDetailTVC: UITableViewCell, UITableViewRegisterable {

    // MARK: - Properties
    
    private let infoLabel = SubtitlLabel(title: "영업정보")
    private let pickLabel = SubtitlLabel(title: "매장 Pick")
    private let facilityLabel = SubtitlLabel(title: "편의시설")

    // MARK: - Initializing
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
        setupAutoLayout()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(style: .default, reuseIdentifier: nil)
    }
    
    // MARK: - UI + Layout

    func configUI() {
    }
    
    func setupAutoLayout() {
        contentView.addSubviews([infoLabel, pickLabel, facilityLabel])
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(20)
        }
        
        pickLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(172)
            make.leading.equalToSuperview().inset(20)
        }
        
        facilityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(306)
            make.leading.equalToSuperview().inset(20)
        }

    }
}
