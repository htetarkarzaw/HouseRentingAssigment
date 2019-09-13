//
//  Extension.swift
//  HouseRentingAppAssigment
//
//  Created by Htet Arkar Zaw on 9/14/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import Foundation
import UIKit
extension UITableView{
    
    func registerForCell(strID : String) {
        register(UINib(nibName: strID, bundle: nil), forCellReuseIdentifier: strID)
    }
}
