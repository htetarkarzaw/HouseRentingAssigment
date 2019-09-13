//
//  Router.swift
//  HouseRentingAppAssigment
//
//  Created by Htet Arkar Zaw on 9/14/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func navigateToDetails(data: HouseVO){
                let storyBoard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: HouseDetailViewController.self)) as? HouseDetailViewController
                if let viewController = vc{
                    vc?.house = data
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
    }
    
}
