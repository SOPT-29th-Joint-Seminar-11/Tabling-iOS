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
    
    var distance: Int = 1
    var likeNum: Int = 18
        
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
        $0.image = Const.Icon.fiveStar
    }
    
    private let rateLabel = UILabel().then {
        $0.text = "5.0"
        $0.textColor = .main
        $0.font = UIFont.noto(type: .medium, size: 14)
    }
    
    private let numLabel = UILabel().then {
        $0.text = "(7)"
        $0.textColor = .black
        $0.font = UIFont.noto(type: .medium, size: 14)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "유니유니는 다양한 스콘, 쿠키, 음료,  자체 제작 케이크로\n보는 즐거움과 더불어 먹는 즐거움을 선사합니다"
        $0.textColor = .gray
        $0.font = UIFont.noto(type: .regular, size: 13)
        $0.numberOfLines = 2
        $0.addSpacing()
    }
    
    private let mapPinImageView = UIImageView().then {
        $0.image = Const.Icon.mapLight
    }
    
    private lazy var distanceLabel = UILabel().then {
        $0.text = "\(distance)km"
        $0.font = UIFont.noto(type: .medium, size: 13)
        $0.textColor = .gray
    }
    
    private let mapStackView = ButtonStackView(image: Const.Icon.map!,
                                               title: "위치", space: 7)
    private let callStackView = ButtonStackView(image: Const.Icon.call!,
                                                title: "전화", space: 7)
    private let shareStackView = ButtonStackView(image: Const.Icon.share!,
                                                 title: "공유", space: 7)
    private lazy var likeStackView = ButtonStackView(image: Const.Icon.heart!,
                                                     title: "\(likeNum)", space: 7).then {
        $0.menuButton.addTarget(self,
                                action: #selector(touchupLikeButton(_:)),
                                for: .touchUpInside)
        $0.menuButton.isSelected = false
    }
    
    private let firstLine = LineView(color: .line, height: 37)
    private let secondLine = LineView(color: .line, height: 37)
    private let thirdLine = LineView(color: .line, height: 37)
    
    private let infoLabel = SubtitleLabel(title: "매장정보", color: .black)
    private let menuLabel = SubtitleLabel(title: "메뉴", color: .gray2)
    private let reviewLabel = SubtitleLabel(title: "리뷰", color: .gray2)
    
    private let menuLineView = LineView(color: .main, height: 2)
    private let lineView = LineView(color: .line, height: 8)

    // MARK: - Initializing
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAutoLayout()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(style: .default, reuseIdentifier: nil)
    }
    
    // MARK: - UI + Layout
    
    private func setupAutoLayout() {
        contentView.addSubviews([nameLabel, addressLabel,
                                 starImageView, rateLabel,
                                 numLabel, descriptionLabel,
                                 mapPinImageView, distanceLabel,
                                 mapStackView, callStackView,
                                 shareStackView, likeStackView,
                                 firstLine, secondLine, thirdLine,
                                 infoLabel, menuLabel, reviewLabel,
                                 menuLineView, lineView])
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(20)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().inset(20)
        }
        
        starImageView.snp.makeConstraints { make in
            make.top.equalTo(addressLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(20)
        }
        
        rateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImageView.snp.centerY)
            make.leading.equalTo(starImageView.snp.trailing).offset(10)
        }
        
        numLabel.snp.makeConstraints { make in
            make.centerY.equalTo(starImageView.snp.centerY)
            make.leading.equalTo(rateLabel.snp.trailing).offset(3)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(starImageView.snp.bottom).offset(11)
            make.leading.equalToSuperview().inset(20)
        }
        
        mapPinImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(21)
            make.trailing.equalTo(distanceLabel.snp.leading).inset(1)
        }
        
        distanceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(21)
            make.trailing.equalToSuperview().inset(20)
        }
        
        mapStackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(34)
            make.leading.equalToSuperview().inset(48)
        }
        
        callStackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(34)
            make.leading.equalTo(mapStackView.snp.trailing).offset(56)
        }
        
        shareStackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(34)
            make.trailing.equalTo(likeStackView.snp.leading).offset(-56)
        }
        
        likeStackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(34)
            make.trailing.equalToSuperview().inset(47)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(menuLineView.snp.centerX)
            make.bottom.equalTo(menuLineView.snp.top).offset(-13)
        }
        
        menuLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(menuLineView.snp.bottom).inset(13)
        }
        
        reviewLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(76)
            make.bottom.equalTo(menuLineView.snp.bottom).inset(13)
        }
        
        firstLine.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(1)
        }
        
        secondLine.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(40)
            make.leading.equalTo(mapStackView.snp.trailing).offset(27.5)
            make.width.equalTo(1)
        }
        
        thirdLine.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(40)
            make.leading.equalTo(shareStackView.snp.trailing).offset(27.5)
            make.width.equalTo(1)
        }

        menuLineView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(45)
            make.bottom.equalTo(lineView.snp.top)
            make.width.equalTo(95)
        }
        
        lineView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    // MARK: - @objc
    
    @objc func touchupLikeButton(_ sender: UIButton) {
        /// 숫자 반영 안됨, 처음 눌렀을 때 바로 하트 채워지지 않음
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.setImage(Const.Icon.heartFill, for: .normal)
            likeNum += 1
        } else {
            sender.setImage(Const.Icon.heart, for: .normal)
            likeNum -= 1
        }
        likeStackView.menuTitleLabel.text = "\(likeNum)"
    }
}
