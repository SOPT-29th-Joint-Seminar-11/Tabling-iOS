//
//  NJCafeTVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/21.
//

import UIKit

class NJCafeTVC: UITableViewCell, UITableViewRegisterable {
    
    // MARK: - Properties
    
    var cafeList: [MainData] = []
    
    private let cafeTitleLabel: UILabel = {
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
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpCollectionView()
        setUpAutoLayout()
        requestStoreList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    func setUpCollectionView() {
        cafeCV.delegate = self
        cafeCV.dataSource = self
        
        NJStoreCVC.register(target: cafeCV)
    }
    
    func setUpAutoLayout() {
        contentView.addSubviews([cafeTitleLabel, cafeCV])
        
        cafeTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        cafeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        cafeCV.topAnchor.constraint(equalTo: cafeTitleLabel.bottomAnchor, constant: 17).isActive = true
        cafeCV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        cafeCV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        cafeCV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        cafeCV.heightAnchor.constraint(equalToConstant: 195).isActive = true
        
        cafeCV.showsHorizontalScrollIndicator = false
        
        [cafeTitleLabel, cafeCV].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    func requestStoreList() {
        NJMainService.shared.getStoreList() { responseData in
            switch responseData {
            case .success(let storeData):
                guard let decodedData = storeData as? MainModel else {return}
                if let cafeList = decodedData.data {
                    self.cafeList = cafeList
                }
                self.cafeCV.reloadData()
            case .requestErr(let bookData):
                print("requestERR", bookData)
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension NJCafeTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cafeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NJStoreCVC.className, for: indexPath) as? NJStoreCVC else {return UICollectionViewCell()}
        
        cell.setData(storeData: cafeList[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension NJCafeTVC: UICollectionViewDelegateFlowLayout {
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
