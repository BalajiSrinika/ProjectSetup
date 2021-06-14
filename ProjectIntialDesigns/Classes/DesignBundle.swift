//
//  File.swift
//  ProjectIntialDesigns
//
//  Created by Balaji  on 14/06/21.
//

import Foundation

/*To Get bundle Name*/
class DesignBundle {
    static var shared = DesignBundle()
    private init() { }
    
    /*Access from Resource Bundle*/
    var currentBundle: Bundle  {
        let frameworkBundle = Bundle(for: DesignBundle.self)
        let bundleURL: URL = frameworkBundle.resourceURL!.appendingPathComponent("Resources.bundle")
        let resourceBundle = Bundle(url: bundleURL)!
        return resourceBundle
    }
    
    /*To get DeviceId and BundleId*/
    var deviceId: String? { return UIDevice.current.identifierForVendor?.uuidString }
    var bundleId: String? { return Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String }
}
