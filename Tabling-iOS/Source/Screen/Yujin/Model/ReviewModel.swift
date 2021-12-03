//
//  ReviewModel.swift
//  Tabling-iOS
//
//  Created by 이유진 on 2021/11/26.
//


import UIKit

struct ReviewModel {
    var storeName: String
    var category: String
    var area: String
    var starImage: UIImage?
    var rating: Double
    var distance: Int
    var photoName: String
    var photo: UIImage?
    var review: String
    var uploadTime: String
    
    init(storeName: String, category: String, area: String, rating: Double, distance: Int, photoName: String, review: String, uploadTime: String){
        self.storeName = storeName
        self.category = category
        self.area = area
        self.rating = rating
        self.distance = distance
        self.photoName = photoName
        self.photo = UIImage(named: photoName)
        self.review = review
        self.uploadTime = uploadTime
        
        switch rating{
        case 1.0:
            self.starImage = Const.Icon.oneStar
        case 2.0:
            self.starImage = Const.Icon.twoStar
        case 3.0:
            self.starImage = Const.Icon.threeStar
        case 4.0:
            self.starImage = Const.Icon.fourStar
        case 5.0:
            self.starImage = Const.Icon.fiveStar
        default:
            self.starImage = Const.Icon.fiveStar
        }
    }
}
