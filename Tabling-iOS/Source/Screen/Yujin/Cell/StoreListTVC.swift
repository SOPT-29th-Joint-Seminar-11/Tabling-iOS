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
    var restaurantList: [StoreModel] = []
    
    var kind: String = "Cafe"

    let collectionView: UICollectionView = {
           
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            
            return cv
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        fetchCafeList()
        initRestaurantData()
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
        collectionView.register(StoreCVC.self, forCellWithReuseIdentifier: "StoreCVC")
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func initRestaurantData(){
        restaurantList.append(contentsOf:[
            StoreModel(photoName: "img_egg", storeName: "애드에그", rating: 4.9, numOfReview: 9, category: "버거", area: "마곡", option: [false,true]),
            StoreModel(photoName: "img_bob", storeName: "예담밥상", rating: 5.0, numOfReview: 3, category: "한식", area: "화양", option: [false,true]),
            StoreModel(photoName: "img_little", storeName: "리틀넥 연남", rating: 4.8, numOfReview: 2, category: "양식", area: "연남", option: [true,true]),
            StoreModel(photoName: "img-woodong", storeName: "우동 카덴", rating: 5.0, numOfReview: 1, category: "일식", area: "합정", option: [true,true])
        ])

    }
    
    func fetchCafeList(){
       
        YJMainService.shared.requestGetCafeList(){responseData in
            switch responseData{
            case .success(let getResponse):
                guard let response = getResponse as? MainModel else {return}
                if let cafeList = response.data{
                    self.storeModelList = cafeList
                }
                self.collectionView.reloadData()
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
        switch self.kind{
        case "cafe":
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCVC.identifier, for: indexPath) as? StoreCVC else {return UICollectionViewCell()}
            cell.setData(storeData: storeModelList[indexPath.row])
            return cell
        case "restaurant":
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCVC.identifier, for: indexPath) as? StoreCVC else {return UICollectionViewCell()}
            cell.setData(storeData: restaurantList[indexPath.row])
            return cell
        default :
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.kind{
        case "cafe":
            return storeModelList.count
        case "restaurant":
            return restaurantList.count
        default:
            return 0
        }
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

