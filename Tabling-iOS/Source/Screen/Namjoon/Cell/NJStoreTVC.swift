//
//  NJStoreTVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/21.
//

import UIKit

class NJStoreTVC: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - Properties
    
    var storeList: [Store] = [
        Store(name: "애드에그", imageLink: "img_egg", score: 4, reviewCount: 9, category: "버거", location: "마곡", canBookNow: false, canLineUpNow: true),
        Store(name: "예담밥상", imageLink: "img_bob", score: 5, reviewCount: 3, category: "한식", location: "화양", canBookNow: false, canLineUpNow: true),
        Store(name: "리틀넥 연남", imageLink: "img_little", score: 4, reviewCount: 2, category: "양식", location: "연남", canBookNow: true, canLineUpNow: true),
        Store(name: "우동 카덴", imageLink: "img-woodong", score: 5, reviewCount: 1, category: "일식", location: "합정", canBookNow: true, canLineUpNow: true)
    ]
    
    var storeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .bold, size: 17)
        label.text = "핫한 맛집, 지금 바로 입장하세요!"
        return label
    }()
    
    var storeCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.isScrollEnabled = true
        return collectionView
    }()

    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpCollectionView()
        setUpAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    func setUpCollectionView() {
        storeCV.delegate = self
        storeCV.dataSource = self
        
        NJStoreCVC.register(target: storeCV)
    }
    
    func setUpAutoLayout() {
        contentView.addSubviews([storeTitleLabel, storeCV])
        
        storeTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 38).isActive = true
        storeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        storeCV.topAnchor.constraint(equalTo: storeTitleLabel.bottomAnchor, constant: 15).isActive = true
        storeCV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        storeCV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        storeCV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        storeCV.heightAnchor.constraint(equalToConstant: 195).isActive = true
        
        storeCV.showsHorizontalScrollIndicator = false
        
        ([storeTitleLabel, storeCV]).forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

// MARK: - UICollectionViewDataSource

extension NJStoreTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NJStoreCVC.className, for: indexPath) as? NJStoreCVC else {return UICollectionViewCell()}
        
        cell.setData(storeData: storeList[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension NJStoreTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 195)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
