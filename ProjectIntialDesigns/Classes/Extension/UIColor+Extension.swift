//
//  UIColor+Extension.swift
//  FinTechProductBase
//
//  Created by sidhudevarayan on 25/08/20.
//  Copyright © 2020 sidhudevarayan. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /*Hex Color*/
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if hexColor.count == 8 {
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }else if hexColor.count == 6 {
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
                }
            }
        }
        return nil
    }
    
    class func setColour(colour: Colour) -> UIColor {
        return UIColor(hex: colour.rawValue)!
    }
}

/*Custom color style*/
public enum Colour: String {
    case lightBlue = "#CEE8FE"
    case skyBlue = "#00AEEF"
    case darkBlue = "#003A63"
    case lightGrey = "#A7A7A7"
    case grey = "#787878"
    case black = "#000000"
    case white = "#FFFFFF"
    case secondary = "#EDEFF7"
    case lightBlack = "#4B4B4B"
    case blueBlack = "#3B3B3B"
    case red = "#EA4335"
    case textBorder = "#7B7B7B"
    case ashColor = "#E5E5E5"
    case lightYellow = "#FAEAB3"
    case lightSkyblue = "#F0F7FC"
    case lightOrange = "#EF6400"
    case darkRed = "#DD2E44"
    case green = "#11A50E"
    case lightGreen = "#E6FDF3"
    case paleYellow = "#FFF2D0"
    case orange = "#FF8A00"
    case lightRed = "#FFE9E9"
    case walletRed = "#FF0F0F"
    case searchBarBg = "#F0F0F0"
    
    case darkYellow = "#F5C242"
}
