//
//  AppConstants.swift
//  HouseRentingAppAssigment
//
//  Created by Htet Arkar Zaw on 9/14/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import Foundation
class AppConstants{
    static let BASE_URL = "https://d0996f53-d1ce-47ad-a628-af026825b79c.mock.pstmn.io/"
    
    enum StoryBoards {
        static let SB_Main = "Main"
    }
    
    enum ApiRout {
        static let GET_HOUSE_LIST = "house_list"
        static let GET_HOUSE_BY_ID = "get_house_by_id"
        static let GET_HOUSE_BY_ID_WITH_FORM_DATA = "get_house_by_id_with_form_data"
        static let GET_HOUSE_BY_ID_WITH_REQUEST_OBJECT = "get_house_by_id_with_request_object"
    }
    
    enum FORM_DATA {
        static let FROM_DATA_HOUSE_ID = "house_id"
    }
    
    enum PARAM {
        static let PARAM_HOUSE_ID = "house_id"
    }
    
    enum REQUEST_TYPE{
        static let CONTENT_TYPE = "Content-Type"
        static let REQUEST_TYPE_FROM_UNLENCODED = "application/x-www-form-urlencoded"
    }
}
