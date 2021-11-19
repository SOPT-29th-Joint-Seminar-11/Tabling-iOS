//
//  TopDetailTVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

import SnapKit
import Then

class TopDetailTVC: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - Properties
    
    private let nameLabel = UILabel().then {
        $0.text = "유니유니"
        $0.textColor = .black
        $0.font = UIFont.noto(type: .bold, size: 22)
    }
    
    private let addressLabel = UILabel().then {
        $0.text = "서울특별시 성북구 길음동 1276"
        $0.textColor = .gray
        $0.font = UIFont.noto(type: .regular, size: 14)
    }
    
    private let starImageView = UIImageView().then {
        $0.image = Const.Icon.starFill
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "유니유니는 다양한 스콘, 쿠키, 음료,  자체 제작 케이크로 보는 즐거움과 더불어 먹는 즐거움을 선사합니다"
        $0.textColor = .gray
        $0.font = UIFont.noto(type: .regular, size: 13)
        $0.numberOfLines = 2
        $0.addSpacing()
    }
    
    private let infoLabel = SubtitleLabel(title: "매장정보", color: .black)
    private let menuLabel = SubtitleLabel(title: "메뉴", color: .gray2)
    private let reviewLabel = SubtitleLabel(title: "리뷰", color: .gray2)
    
    private let menuLineView = LineView(color: .main, height: 2)
    private let lineView = LineView(color: .line, height: 8)

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
        contentView.addSubviews([menuLineView, lineView])
        
        menuLineView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(45)
            make.bottom.equalTo(lineView.snp.top)
            make.width.equalTo(95)
        }
        
        lineView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}
