//
//  Constant.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/14.
//

import UIKit

struct Const {
    
    // MARK: - Icon
    
    public enum Icon {
        
        //탭바 아이콘
        public static let home = UIImage(named: "homeSelected")
        public static let homeUnselected = UIImage(named: "homeUnselected")
        
        public static let wish = UIImage(named: "wishSelected")
        public static let wishUnselected = UIImage(named: "wishUnselected")
        
        public static let calendar = UIImage(named: "calendarSelected")
        public static let calendarUnselected = UIImage(named: "calendarUnselected")
        
        public static let mypage = UIImage(named: "mypageSelected")
        public static let mypageUnselected = UIImage(named: "mypageUnselected")
    
        //디테일뷰 매장 인포 버튼용 아이콘
        public static let map = UIImage(named: "ic_map")
        public static let call = UIImage(named: "ic_call")
        public static let share = UIImage(named: "ic_share")
        public static let heart = UIImage(named: "ic_wish_on")
        public static let heartFill = UIImage(named: "ic_wish_off")
        
        //현재위치로부터 거리 아이콘
        public static let mapLight = UIImage(named: "ic_map_light")
        
        //디테일뷰 하단 편의시설 정보 아이콘
        public static let dog = UIImage(named: "ic_dog")
        public static let wifi = UIImage(named: "ic_wifi")
        public static let car = UIImage(named: "ic_car")
        
        //별점 아이콘
        public static let star = UIImage(named: "star_off")
        public static let starFill = UIImage(named: "star_on")
        
        //각종 버튼용 아이콘
        public static let chevronDown = UIImage(named: "btn_address")
        public static let chevronBack = UIImage(named: "btn_back")
        public static let search = UIImage(named: "btn_search")
        
        //로고
        public static let logo = UIImage(named: "ic_logo")
       
    }
    
    // MARK: - Tag
    
    public enum Tag {
        
        //매장 Pick 태그
        public static let calm = UIImage(named: "ic_chip_pick_calm")
        public static let clean = UIImage(named: "ic_chip_pick_clean")
        public static let date = UIImage(named: "ic_chip_pick_date")
        public static let dessert = UIImage(named: "ic_chip_pick_dessert")
        public static let group = UIImage(named: "ic_chip_pick_group")
        public static let quiet = UIImage(named: "ic_chip_pick_quiet")
        
        //매장별 옵션정보 태그
        public static let book = UIImage(named: "ic_book")
        public static let line = UIImage(named: "ic_line")
        
    }
    
}
