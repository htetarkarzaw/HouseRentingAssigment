//
//  BaseViewController.swift
//  HouseRentingAppAssigment
//
//  Created by Htet Arkar Zaw on 9/14/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}

extension BaseViewController : NVActivityIndicatorViewable{
    func showProgress(message : String){
        startAnimating(CGSize(width: 30, height: 30), message: message, type: NVActivityIndicatorType.ballClipRotateMultiple)
    }
    
    func hideProgress(){
        stopAnimating()
    }
}
