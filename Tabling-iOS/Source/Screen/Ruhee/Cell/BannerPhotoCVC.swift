//
//  BannerPhotoCVC.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/19.
//

import UIKit

import Kingfisher
import SnapKit

class BannerPhotoCVC: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    private let bannerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    // MARK: - Initializing

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI + Layout
    
    func setupAutoLayout() {
        contentView.addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Set Data
    
    func setData(banner: String) {        

        if let banner = URL(string: banner) {
            bannerImageView.kf.setImage(with: banner)
        }
    }
}
