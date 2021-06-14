//
//  NoInternetViewController.swift
//  FinTechProductBase
//
//  Created by sidhudevarayan on 25/08/20.
//  Copyright © 2020 sidhudevarayan. All rights reserved.
//

import UIKit
import SystemConfiguration


class NoInternetViewController: UIViewController {

    /*Retry Button*/
    @IBOutlet weak var tryAgainBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tryAgainBtn.primaryBtn()
    }
    
    /*Retry action*/
    @IBAction func `tryAgainAction`(_ sender: UIButton) {
        guard isInternetAvailable() else {
            return
        }
    }
}


/*Check Internet Connection*/
public func isInternetAvailable() -> Bool {
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
            SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
        }
    }
    
    var flags = SCNetworkReachabilityFlags()
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
        return false
    }
    let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
    let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
    if let topVC = UIApplication.getTopViewController(){
        if !isReachable, !(topVC is NoInternetViewController) {
            //hideLoader()
            let noInternet = UIStoryboard(name:"NoInternet", bundle: DesignBundle.shared.currentBundle)
            let noInternetView = noInternet.instantiateViewController(withIdentifier: "NoInternetViewController") as! NoInternetViewController
           topVC.present(noInternetView, animated: true, completion: nil)
        }else if isReachable, topVC is NoInternetViewController {
            topVC.dismiss(animated: true, completion: nil)
        }else{
            /* NoInternet Controller already presented*/
        }
    }
    return (isReachable && !needsConnection)
}


/* UIApplication Extension */
extension UIApplication {

    /*Get the Top VC*/
    class func getTopViewController(base: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
