//
//  UIColor+Extension.swift
//  Tabling-iOS
//
//  Created by 이유진 on 2021/11/16.
//

import UIKit

extension UIColor {

  @nonobjc class var black: UIColor {
    return UIColor(red: 10.0 / 255.0, green: 11.0 / 255.0, blue: 16.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var main: UIColor {
    return UIColor(red: 1.0, green: 34.0 / 255.0, blue: 0.0, alpha: 1.0)
  }
    //gray
  @nonobjc class var subtitleGray: UIColor {
    return UIColor(white: 143.0 / 255.0, alpha: 1.0)
  }
    //line
  @nonobjc class var sectionDivisionGray: UIColor {
    return UIColor(red: 243.0 / 255.0, green: 245.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
  }
    //gray2
  @nonobjc class var unselectedPageGray: UIColor {
    return UIColor(white: 215.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var white: UIColor {
    return UIColor(white: 1.0, alpha: 1.0)
  }
    //gray3
  @nonobjc class var darkGray: UIColor {
    return UIColor(red: 90.0 / 255.0, green: 95.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
  }
    //gray4
  @nonobjc class var headerLineGray: UIColor {
    return UIColor(white: 231.0 / 255.0, alpha: 1.0)
  }
    //gray5
  @nonobjc class var tabbarLineGray: UIColor {
    return UIColor(white: 193.0 / 255.0, alpha: 1.0)
  }

}
