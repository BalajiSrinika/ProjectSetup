//
//  UIButton+Extension.swift
//  FinTechProductBase
//
//  Created by sidhudevarayan on 25/08/20.
//  Copyright © 2020 sidhudevarayan. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    /*Set Primary Color*/
    func primaryBtn(shadow :Bool = false){
        self.adjustsImageWhenHighlighted = false
        self.contentEdgeInsets = UIEdgeInsets(top:0,left:10,bottom:0,right:10)
        self.backgroundColor = .setColour(colour: .skyBlue)
        self.layer.cornerRadius = 5
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.font = .setCustomFont(name: .regular, size: .x18)
        self.setTitleColor(.white, for: .normal)
        if shadow {
            self.layer.shadowOffset = CGSize(width: 0, height: 5)
            self.layer.shadowColor = UIColor.setColour(colour: .lightGrey).cgColor
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 5
        }
    }
    
    /*Set Secondary Color*/
    func secondaryBtn(){
        self.adjustsImageWhenHighlighted = false
        self.contentEdgeInsets = UIEdgeInsets(top:0,left:10,bottom:0,right:10)
        self.backgroundColor = .setColour(colour: .secondary)
        self.layer.cornerRadius = 5
        self.setTitleColor(.setColour(colour: .darkBlue), for: .normal)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.font = .setCustomFont(name: .regular, size: .x18)
    }
    
    func borderedButton(color : UIColor = UIColor.setColour(colour: .secondary)){
        self.adjustsImageWhenHighlighted = false
        self.contentEdgeInsets = UIEdgeInsets(top:0,left:10,bottom:0,right:10)
        self.backgroundColor = .setColour(colour: .white)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.5
        self.layer.borderColor = color.cgColor
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.font = .setCustomFont(name: .regular, size: .x16)
        self.setTitleColor(.setColour(colour: .skyBlue), for: .normal)
    }
    
    /*Button with Underline*/
    func btnWithUnderline(title: String,color : UIColor = UIColor.setColour(colour: .skyBlue)) {
        self.contentEdgeInsets = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        let yourAttributes: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue, .foregroundColor : color]
        let attributeString = NSMutableAttributedString(string: title,
                                                        attributes: yourAttributes)
        self.setAttributedTitle(attributeString, for: .normal)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    /*Underline button from range*/
    func underlineWithRange(location: Int, length: Int) {
        self.contentEdgeInsets = UIEdgeInsets(top:0,left:10,bottom:0,right:10)
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSRange(location: location, length: length))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hex: "#1c1d22") as Any, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}


