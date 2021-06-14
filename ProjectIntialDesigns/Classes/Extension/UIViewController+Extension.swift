//
//  UIViewController+Extension.swift
//  FinTechProductBase
//
//  Created by sidhudevarayan on 25/08/20.
//  Copyright © 2020 sidhudevarayan. All rights reserved.
//

import Foundation
import UIKit
//import IQKeyboardManagerSwift

extension UIViewController {
    
    func getCurrentDate()->String{
        let formatter = DateFormatter()
        //2016-12-08 03:37:22 +0000
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let now = Date()
        let dateString = formatter.string(from:now)
        NSLog("%@", dateString)
        return dateString
    }
    
    func getCurrentYear()->String{
        let formatter = DateFormatter()
        //2016-12-08 03:37:22 +0000
        formatter.dateFormat = "yyyy"
        let now = Date()
        let dateString = formatter.string(from:now)
        NSLog("%@", dateString)
        return dateString
    }
    
    
    /*Dismiss or Pop back*/
    func dismissVC(){
        if (self.presentingViewController != nil){
            self.dismiss(animated: true, completion: nil)
        }else{
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    //    class func disableIQKeyboardManagerToolbar(){
    //        IQKeyboardManager.shared.disabledToolbarClasses.append(self)
    //    }
    
    func delay(interval: TimeInterval, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            closure()
        }
    }
    
    func alertWithNoAction(title : String = "Coming Soon ..."){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        self.present(alertController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5){
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
