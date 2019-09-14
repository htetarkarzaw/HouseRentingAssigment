//
//  HouseModel.swift
//  HouseRentingAppAssigment
//
//  Created by Htet Arkar Zaw on 9/14/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import Foundation
import Alamofire
import  SwiftyJSON
class HouseModel{
    
    var houseResponse: HouseResponse = HouseResponse()
    var houseVo : HouseVO = HouseVO()
    
    class func shared() -> HouseModel {
        return sharedHouseModel
    }
    private static var sharedHouseModel : HouseModel = {
        let houseModel = HouseModel()
        return houseModel
    }()
    
    func apiGetHouseList(success : @escaping () ->Void,
                         failure : @escaping (String) ->Void){
        NetworkClient.shared().getData(success: { (data) in
            guard let data = data as? Data else { return }
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                self.houseResponse = try
                    decoder.decode(HouseResponse.self, from: data)
                success()
            } catch let jsonErr{
                failure(jsonErr.localizedDescription)
            }
        }) { (err) in
            failure(err)
        }
    }
    
    func apiGetHouseById(houseId : Int , success : @escaping () ->Void,
                         failure : @escaping (String) ->Void) {
        let headers: HTTPHeaders = [
            AppConstants.PARAM.PARAM_HOUSE_ID: String(houseId)
        ]
        let parameter: Parameters = [:]
        NetworkClient.shared().getDataByHeader(route: AppConstants.ApiRout.GET_HOUSE_BY_ID, headers: headers, parameter: parameter, success: { (data) in
            guard let data = data as? JSON else {return}
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self.houseVo = try
                    decoder.decode(HouseVO.self, from: Data(data.rawData()))
            }catch let jsonErr{
                failure(jsonErr.localizedDescription)
            }
        }) { (err) in
            failure(err)
        }
    }
    
    func apiGetHouseByIdWithFormData(houseId : Int,
                                     success: @escaping() -> Void,
                                     failure: @escaping(String) -> Void){
        let headers: HTTPHeaders = [:]
        let parameter: Parameters = [
            AppConstants.PARAM.PARAM_HOUSE_ID: String(houseId)
        ]
        NetworkClient.shared().postFormData(route: AppConstants.ApiRout.GET_HOUSE_BY_ID_WITH_FORM_DATA, headers: headers, parameter: parameter, success: { (data) in
            guard let data = data as? JSON else {return}
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self.houseVo = try
                    decoder.decode(HouseVO.self, from: Data(data.rawData()))
            }catch let jsonErr{
                failure(jsonErr.localizedDescription)
            }
        }) { (err) in
            failure(err)
        }
    }
    
    func apiGetHouseByIdWithRawData(houseRequest : HouseRequest,
                                    success: @escaping() -> Void,
                                    failure: @escaping(String) -> Void){
        var request = URLRequest(url: URL(string : AppConstants.BASE_URL + AppConstants.ApiRout.GET_HOUSE_BY_ID_WITH_REQUEST_OBJECT)!)
        request.httpMethod = "POST"
        request.setValue(AppConstants.REQUEST_TYPE.REQUEST_TYPE_FROM_UNLENCODED, forHTTPHeaderField: AppConstants.REQUEST_TYPE.CONTENT_TYPE)
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        do{
            request.httpBody = try
            encoder.encode(houseRequest)
            
        }catch let jsonErr{
            failure(jsonErr.localizedDescription)
        }
        
        NetworkClient.shared().postRawData(request: request, success: { (data) in
            guard let data = data as? JSON else {return}
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self.houseVo = try
                    decoder.decode(HouseVO.self, from: Data(data.rawData()))
            }catch let jsonErr{
                failure(jsonErr.localizedDescription)
            }
        }) { (err) in
            failure(err)
        }
        
    }
}
