//
//  ReviewListTVC.swift
//  Tabling-iOS
//
//  Created by 이유진 on 2021/11/26.
//

import UIKit

class ReviewListTVC: UITableViewCell {

    static let identifier = "ReviewListTVC"
    var reviewModelList: [ReviewModel] = []

    let collectionView: UICollectionView = {
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            
            return cv
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initData()
        setupAutoLayout()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCollectionView(){
        collectionView.register(ReviewCVC.self, forCellWithReuseIdentifier: "ReviewCVC")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func initData(){
        reviewModelList.append(contentsOf:[
            ReviewModel(storeName: "이태리집", category: "이탈리안", area: "김포", rating: 4.0, distance: 1, photoName: "img_italy", review: "다음날도 생각나는 맛, 모든 요리가 다 괜찮았습니다.", uploadTime: "46초"),
            ReviewModel(storeName: "하루", category: "일식", area: "방화", rating: 5.0, distance: 3, photoName: "img_italy", review: "정성이 한땀 한땀 느껴지는 음식!셰프님 최고!", uploadTime: "5시간"),
            ReviewModel(storeName: "후지일식", category: "일식", area: "홍대", rating: 3.0, distance: 5, photoName: "img_italy", review: "셰프님의 장인정신,직접 경험해보세요!", uploadTime: "6시간")
        ])
    }
    
    func setupAutoLayout() {
        contentView.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 0).isActive =  true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 0).isActive = true
        
    }
}

extension ReviewListTVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCVC.identifier, for: indexPath) as? ReviewCVC else {return UICollectionViewCell()}
        cell.setData(reviewData: reviewModelList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewModelList.count
    }
}

extension ReviewListTVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 230, height: 319)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

