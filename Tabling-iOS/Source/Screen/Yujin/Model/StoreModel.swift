//
//  StoreModel.swift
//  Tabling-iOS
//
//  Created by 이유진 on 2021/11/22.
//

import UIKit

struct StoreModel {
    var photo: UIImage?
    var photoName: String
    var storeName: String
    var rating: Double
    var numOfReview: Int
    var category: String
    var area: String
    var option: [Bool]
    
    init(photoName: String,storeName: String,rating: Double,numOfReview: Int,category: String,area: String,option: [Bool]){
        self.photoName = photoName
        self.photo = UIImage(named: photoName)
        self.storeName = storeName
        self.rating = rating
        self.numOfReview = numOfReview
        self.category = category
        self.area = area
        self.option = option
    }
}
