//
//  HouseResponse.swift
//  HouseRentingAppAssigment
//
//  Created by Htet Arkar Zaw on 9/14/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import Foundation
struct HouseResponse: Codable {
    var code: Int?
    var message: String?
    var data: [HouseVO]?
}
