//
//  StoreListTVC.swift
//  Tabling-iOS
//
//  Created by 이유진 on 2021/11/22.
//

import UIKit

class StoreListTVC: UITableViewCell {

    static let identifier = "StoreListTVC"
    var storeModelList: [MainData] = []

    let collectionView: UICollectionView = {
           
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            
            return cv
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //initData()
        setupAutoLayout()
        setupCollectionView()
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib(){
//        fetchCafeList()
//        print("#333333333")
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fetchCafeList(){
       
        YJMainService.shared.requestGetCafeList(){responseData in
            switch responseData{
            case .success(let getResponse):
                guard let response = getResponse as? MainModel else {return}
                if let cafeList = response.data{
                    self.storeModelList = cafeList
                }
            case .requestErr(let msg):
                print("requestErr \(msg)")
            case .pathErr(let msg):
                print("pathErr \(msg)")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            
            
        }
        
    }
    
    func setupCollectionView(){
        collectionView.register(StoreCVC.self, forCellWithReuseIdentifier: "StoreCVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
//
//    func initData(){
//        storeModelList.append(contentsOf:[
//            StoreModel(storeName: "유니유니", rating: 5.0, numOfReview: 7, category: "카페", area: "상수", option: [true,true]),
//            StoreModel(storeName: "유니유니", rating: 5.0, numOfReview: 7, category: "카페", area: "상수", option: [false,true]),
//            StoreModel(storeName: "유니유니", rating: 5.0, numOfReview: 7, category: "카페", area: "상수", option: [true,false]),
//            StoreModel(storeName: "유니유니", rating: 5.0, numOfReview: 7, category: "카페", area: "상수", option: [false,false]),
//            StoreModel(storeName: "유니유니", rating: 5.0, numOfReview: 7, category: "카페", area: "상수", option: [true,true]),
//            StoreModel(storeName: "유니유니", rating: 5.0, numOfReview: 7, category: "카페", area: "상수", option: [true,true])
//        ])
//
//    }
    
    func setupAutoLayout() {
        contentView.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 0).isActive =  true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 0).isActive = true
        
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension StoreListTVC: UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCVC.identifier, for: indexPath) as? StoreCVC else {return UICollectionViewCell()}
        cell.setData(storeData: storeModelList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeModelList.count
    }
}

extension StoreListTVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 215)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

