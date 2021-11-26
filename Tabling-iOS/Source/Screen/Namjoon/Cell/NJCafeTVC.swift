//
//  NJCafeTVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/21.
//

import UIKit

class NJCafeTVC: UITableViewCell, UITableViewRegisterable {
    
    var cafeList: [Store] = [
        Store(name: "유니유니", imageName: "image_main", score: 5, reviewCount: 7, category: "카페", location: "성수", canBookNow: true, canLineUpNow: true),
        Store(name: "카페 모이아", imageName: "image_main", score: 4, reviewCount: 7, category: "카페", location: "연남", canBookNow: false, canLineUpNow: true),
        Store(name: "레이어드", imageName: "image_main", score: 4, reviewCount: 7, category: "카페", location: "연남", canBookNow: true, canLineUpNow: true),
        Store(name: "홍대 마카롱", imageName: "image_main", score: 5, reviewCount: 9, category: "카페", location: "상수", canBookNow: true, canLineUpNow: true)
    ]
    
    var cafeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .bold, size: 17)
        label.text = "디저트가 맛있는 카페"
        return label
    }()
    
    var cafeCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.isScrollEnabled = true
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpCollectionView()
        setUpAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpCollectionView() {
        cafeCV.delegate = self
        cafeCV.dataSource = self
        
        NJStoreCVC.register(target: cafeCV)
    }
    
    func setUpAutoLayout() {
        contentView.addSubviews([cafeTitleLabel, cafeCV])
        
        cafeTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        cafeTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        
        cafeCV.topAnchor.constraint(equalTo: cafeTitleLabel.bottomAnchor, constant: 17).isActive = true
        cafeCV.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        cafeCV.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        cafeCV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        cafeCV.heightAnchor.constraint(equalToConstant: 195).isActive = true
        cafeCV.showsHorizontalScrollIndicator = false
        cafeCV.showsVerticalScrollIndicator = false
        
        [cafeTitleLabel, cafeCV].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

}

extension NJCafeTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cafeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NJStoreCVC.className, for: indexPath) as? NJStoreCVC else {return UICollectionViewCell()}
        
        cell.setData(name: cafeList[indexPath.row].name,
                     imageName: cafeList[indexPath.row].imageName,
                     score: cafeList[indexPath.row].score,
                     reviewCount: cafeList[indexPath.row].reviewCount,
                     category: cafeList[indexPath.row].category,
                     location: cafeList[indexPath.row].location,
                     canBookNow: cafeList[indexPath.row].canBookNow,
                     canLineUpNow: cafeList[indexPath.row].canLineUpNow)
        
        return cell
    }
}

extension NJCafeTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 195)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
