//
//  NJReviewTVC.swift
//  Tabling-iOS
//
//  Created by 이남준 on 2021/11/21.
//

import UIKit

class NJReviewTVC: UITableViewCell, UITableViewRegisterable {
    
    var reviewList: [Review] = [
        Review(name: "이태리집", category: "이탈리안", location: "김포", reviewCount: 4, fromHere: 1, imageName: "img_italy", description: "다음날도 생각나는 맛,\n모든 요리가 다 괜찮았습니다.", fromNow: "46초전"),
        Review(name: "하루", category: "일식", location: "방화", reviewCount: 5, fromHere: 3, imageName: "img_italy", description: "정성이 한땀한땀 느껴지는 음식!\n셰프님 최고!", fromNow: "5시간 전"),
        Review(name: "후지일식", category: "일식", location: "홍대", reviewCount: 3, fromHere: 5, imageName: "img_italy", description: "셰프님의 장인정신,\n직접 경험해보세요!", fromNow: "6시간 전")
    ]
    
    var reviewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.noto(type: .bold, size: 17)
        label.text = "테이블링 Best 리뷰"
        return label
    }()
    
    var reviewCV : UICollectionView = {
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
        reviewCV.delegate = self
        reviewCV.dataSource = self
        reviewCV.backgroundColor = .orange
        
        NJReviewCVC.register(target: reviewCV)
    }

    func setUpAutoLayout() {
        contentView.addSubviews([reviewTitleLabel, reviewCV])
        
        reviewTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        reviewTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        
        reviewCV.topAnchor.constraint(equalTo: reviewTitleLabel.bottomAnchor, constant: 15).isActive = true
        reviewCV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        reviewCV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        reviewCV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
//        reviewCV.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        [reviewTitleLabel, reviewCV].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

}

extension NJReviewTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NJReviewCVC.className, for: indexPath) as? NJReviewCVC else {return UICollectionViewCell()}
        
        cell.setData(name: reviewList[indexPath.row].name,
                     category: reviewList[indexPath.row].category,
                     location: reviewList[indexPath.row].location,
                     reviewCount: reviewList[indexPath.row].reviewCount,
                     fromHere: reviewList[indexPath.row].fromHere,
                     imageName: reviewList[indexPath.row].imageName,
                     description: reviewList[indexPath.row].description,
                     fromNow: reviewList[indexPath.row].fromNow)
        
        return cell
    }
}

extension NJReviewTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 230, height: 319)
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
