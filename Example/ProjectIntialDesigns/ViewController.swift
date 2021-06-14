//
//  ViewController.swift
//  ProjectIntialDesigns
//
//  Created by BalajiSrinika on 06/14/2021.
//  Copyright (c) 2021 BalajiSrinika. All rights reserved.
//

import UIKit
import ProjectIntialDesigns

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isInternetAvailable(){
            print("Available")
        }else{
            print("No internet")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

