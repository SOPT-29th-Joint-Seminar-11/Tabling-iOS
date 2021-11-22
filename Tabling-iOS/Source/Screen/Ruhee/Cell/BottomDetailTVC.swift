//
//  BottomDetailTVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

import SnapKit
import Then

class BottomDetailTVC: UITableViewCell, UITableViewRegisterable {

    // MARK: - Properties
    
    private let infoLabel = SubtitleLabel(title: "영업정보", color: .black)
    
    private let moreButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.titleLabel?.font = UIFont.noto(type: .medium, size: 13)
        $0.setTitleColor(.gray3, for: .normal)
    }
    
    private lazy var onStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 22
        $0.addArrangedSubviews([onLabel, onTimeLabel])
    }
    
    private lazy var offStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 22
        $0.addArrangedSubviews([offLabel, offTimeLabel])
    }
    
    private lazy var holidayStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 35
        $0.addArrangedSubviews([holidayLabel, sundayLabel])
    }
    
    private let onLabel = InfoLabel(title: "운영시간")
    private let onTimeLabel = InfoLabel(title: "오늘   11:30  ~  22:00")
    private let offLabel = InfoLabel(title: "휴식시간")
    private let offTimeLabel = InfoLabel(title: "16:00  ~ 17:00")
    private let holidayLabel = InfoLabel(title: "휴무일")
    private let sundayLabel = InfoLabel(title: "일요일")
    
    private let pickLabel = SubtitleLabel(title: "매장 Pick", color: .black)
    
    private lazy var firstTagStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.addArrangedSubviews([cleanView,
                                quietView,
                                calmView])
    }
    
    private lazy var secondTagStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.addArrangedSubviews([dateView,
                                dessertView,
                                groupView])
    }
    
    private let cleanView = TagView(tag: "깨끗한")
    private let quietView = TagView(tag: "조용한")
    private let calmView = TagView(tag: "차분한")
    private let dateView = TagView(tag: "데이트 하기 좋은")
    private let dessertView = TagView(tag: "디저트")
    private let groupView = TagView(tag: "단체석")
    
    private let facilityLabel = SubtitleLabel(title: "편의시설", color: .black)
    
    private lazy var facilityStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 24
        $0.distribution = .fillEqually
        $0.addArrangedSubviews([petStackView,
                                wifiStackView,
                                carStackView])
    }
    
    private let petStackView = FacilityCardView(image:Const.Icon.dog!,
                                                title: "반려동물 동반", space: 2)
    private let wifiStackView = FacilityCardView(image: Const.Icon.wifi!,
                                                 title: "무선 인터넷", space: 2)
    private let carStackView = FacilityCardView(image: Const.Icon.car!,
                                                title: "주차 가능", space: 2)

    // MARK: - Initializing
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAutoLayout()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(style: .default, reuseIdentifier: nil)
    }
    
    // MARK: - UI + Layout
    
    func setupAutoLayout() {
        contentView.addSubviews([infoLabel, moreButton,
                                 onStackView, offStackView, holidayStackView,
                                 pickLabel, firstTagStackView, secondTagStackView,
                                 facilityLabel, facilityStackView])
        
        moreButton.snp.makeConstraints { make in
            make.centerY.equalTo(infoLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(20)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(20)
        }
        
        onStackView.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(9)
            make.leading.equalToSuperview().inset(20)
        }
        
        offStackView.snp.makeConstraints { make in
            make.top.equalTo(onStackView.snp.bottom).offset(6)
            make.leading.equalToSuperview().inset(20)
        }
        
        holidayStackView.snp.makeConstraints { make in
            make.top.equalTo(offStackView.snp.bottom).offset(6)
            make.leading.equalToSuperview().inset(20)
        }
        
        [onLabel, offLabel, holidayLabel].forEach {
            $0.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
        }}
        
        [onTimeLabel, offTimeLabel, sundayLabel].forEach {
            $0.snp.makeConstraints { make in
                make.top.trailing.bottom.equalToSuperview()
        }}
        
        pickLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(172)
            make.leading.equalToSuperview().inset(20)
        }
        
        firstTagStackView.snp.makeConstraints { make in
            make.top.equalTo(pickLabel.snp.bottom).offset(9)
            make.leading.equalToSuperview().inset(20)
        }
        
        secondTagStackView.snp.makeConstraints { make in
            make.top.equalTo(firstTagStackView.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(20)
        }
        
        facilityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(306)
            make.leading.equalToSuperview().inset(20)
        }
        
        facilityStackView.snp.makeConstraints { make in
            make.top.equalTo(facilityLabel.snp.bottom).offset(9)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(87)
        }
    }
}

