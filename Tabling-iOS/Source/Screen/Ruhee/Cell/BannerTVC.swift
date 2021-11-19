//
//  BannerTVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

import SnapKit
import Then

class BannerTVC: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - DummyData
    
    private let bannerList = ["img_uni", "img_uni"]
    
    // MARK: - Properties
    
    private var num: Int = 3
    private var page: Int = 1
    
    private lazy var bannerCV = UICollectionView(frame: .zero,
                                                  collectionViewLayout: layout).then {
        $0.showsHorizontalScrollIndicator = false
        $0.isPagingEnabled = true
        $0.delegate = self
        $0.dataSource = self
        BannerPhotoCVC.register(target: $0)
    }
    
    private let layout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    
    private lazy var teamView = UIView().then {
        $0.backgroundColor = .main
        $0.layer.cornerRadius = 14
        $0.addSubview(teamLabel)
    }
    
    private lazy var teamLabel = UILabel().then {
        $0.text = "대기 \(num)팀"
        $0.textColor = .white
        $0.font = UIFont.noto(type: .bold, size: 13)
    }
    
    private lazy var pageView = UIView().then {
        $0.backgroundColor = .black
        $0.alpha = 0.3
        $0.layer.cornerRadius = 14
    }
    
    private lazy var pageLabel = UILabel().then {
        $0.text = "\(page)/\(bannerList.count)"
        $0.textColor = .white
        $0.font = UIFont.noto(type: .bold, size: 13)
    }

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
        contentView.addSubviews([bannerCV, teamView, pageView, pageLabel])
        
        bannerCV.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        teamView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(17)
            make.height.equalTo(28)
        }
        
        teamLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(1)
            make.leading.trailing.equalToSuperview().inset(11)
        }
        
        pageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(18)
            make.height.equalTo(28)
        }
        
        pageLabel.snp.makeConstraints { make in
            make.top.equalTo(pageView.snp.top).inset(1)
            make.leading.equalTo(pageView.snp.leading).inset(10)
            make.bottom.equalTo(pageView.snp.bottom).inset(1)
            make.trailing.equalTo(pageView.snp.trailing).inset(13)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension BannerTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerPhotoCVC.className, for: indexPath) as? BannerPhotoCVC
        else { return UICollectionViewCell() }
        cell.setData(banner: bannerList[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension BannerTVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.contentView.frame.size.width, height: 204)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat { // 상하간격
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { // 좌우간격
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
}
