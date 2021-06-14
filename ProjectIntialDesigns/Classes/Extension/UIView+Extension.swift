//
//  UIView+Extension.swift
//  FinTechProductBase
//
//  Created by sidhudevarayan on 24/08/20.
//  Copyright © 2020 sidhudevarayan. All rights reserved.
//

import Foundation
import UIKit

/*UIView extension class*/

/** get subviews of views  **/
extension UIView {
    
    /** This is the function to get subViews of a view of a particular type
     */
    func subViews<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        for view in self.subviews {
            if let aView = view as? T{
                all.append(aView)
            }
        }
        return all
    }
    
    
    /** This is a function to get subViews of a particular type from view recursively. It would look recursively in all subviews and return back the subviews of the type T */
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
}

extension UIView {
    
    /*Set Corner Radius for view*/
    func setCornerRadius(radius : CGFloat = 10) {
        self.layer.cornerRadius = radius
    }
    
    /*Set Circle*/
    func circleRadius(){
        self.layer.cornerRadius = self.frame.size.height/2
    }
    
    /*Set Corner for selected Edge*/
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    /*Set Corner for selected Edge along with Dashed Border*/
    func roundCornersWithDashedBorder(color: UIColor? = UIColor.setColour(colour: .skyBlue), corners: UIRectCorner? = [.allCorners], cornerRadius: CGFloat? = 10.0) {
        let cornerRadius = cornerRadius ?? 10.0
        let corners = corners ?? [.allCorners]
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.setColour(colour: .skyBlue).cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineDashPattern = [7, 3]
        shapeLayer.frame = bounds
        shapeLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        layer.cornerRadius = cornerRadius
        layer.addSublayer(shapeLayer)
    }
    
    /*Dismiss the custom view*/
    func dismissView(onCompletion completion : (()->Void)?){
        self.removeFromSuperview()
        completion?()
    }
    
    /*Add shadow to view*/
    func addShadow(shadowOffSetHeight: CGFloat = 5, shadowRadius: CGFloat = 10, shadowOpacity: Float = 1) {
        self.layer.shadowOffset = CGSize(width: 0, height: shadowOffSetHeight)
        self.layer.shadowColor = UIColor.setColour(colour: .lightGrey).cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
    
    /*Add shadow to subview which is inside inside container view*/
    func dropShadowOn(subView: UIView, shadowRadius: CGFloat = 2, cornerRadius: CGFloat = 15, shadowOpacity: Float = 1) {
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor.setColour(colour: .lightGrey).cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = shadowRadius
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        subView.clipsToBounds = true
        subView.layer.cornerRadius = cornerRadius
    }
    
    /*Set Dashed Line*/
    func setDashedLine(color:CGColor = UIColor.setColour(colour: .skyBlue).cgColor){
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: self.bounds.minX, y: self.bounds.minY), CGPoint(x: self.frame.width, y: self.bounds.minX)])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
    
    //    /*Set Gradient*/
    func setGradientView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.locations = [0,1]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [UIColor.setColour(colour: .darkBlue).cgColor, UIColor.setColour(colour: .lightBlue).cgColor]
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.setCornerRadius()
    }
    
    /*Add shadow*/
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }
}

extension UIView {
    
    @IBInspectable
    var corner: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidthView: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColorView: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadiusView: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shadowOffsetView : CGSize{
        
        get{
            return layer.shadowOffset
        }set{
            
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColorView : UIColor{
        get{
            return UIColor.init(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacityView : Float {
        
        get{
            return layer.shadowOpacity
        }
        set {
            
            layer.shadowOpacity = newValue
            
        }
    }
}

