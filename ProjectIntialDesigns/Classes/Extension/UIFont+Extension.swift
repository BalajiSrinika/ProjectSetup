//
//  UIFont+Extension.swift
//  FinTechProductBase
//
//  Created by sidhudevarayan on 25/08/20.
//  Copyright © 2020 sidhudevarayan. All rights reserved.
//

import Foundation
import UIKit

/*Custom font type*/
enum FontType: String {
    case regular = "SFProDisplay-Regular"
    case semiBold = "SFProDisplay-SemiBold"
    case bold = "SFProDisplay-Bold"
    case medium = "SFProDisplay-Medium"
    case thin = "SFProDisplay-Thin"
    case black = "SFProDisplay-Black"
    case light = "SFProDisplay-Light"
}

/*Custom font size*/
enum FontSize: CGFloat {
    case x8 = 8.0
    case x10 = 10.0
    case x12 = 12.0
    case x14 = 14.0
    case x13 = 13.0
    case x16 = 16.0
    case x18 = 18.0
    case x20 = 20.0
    case x22 = 22.0
    case x24 = 24.0
    case x26 = 26.0
    case x28 = 28.0
    case x30 = 30.0
}

/*Set Custom font and size*/
extension UIFont {
    class func setCustomFont(name: FontType, size: FontSize) -> UIFont {
        return UIFont(name: name.rawValue, size: size.rawValue) ?? UIFont.systemFont(ofSize: 16)
    }
}
