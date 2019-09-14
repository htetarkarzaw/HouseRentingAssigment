//
//  NetwrokClient.swift
//  HouseRentingAppAssigment
//
//  Created by Htet Arkar Zaw on 9/14/19.
//  Copyright © 2019 Htet Arkar Zaw. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkClient{
    
    private let baseUrl : String
    
    private init(baseUrl : String){
        self.baseUrl = baseUrl
    }
    
    private static var sharedNetwrokClient : NetworkClient = {
        let url = AppConstants.BASE_URL
        return NetworkClient(baseUrl: url)
    }()
    
    class func shared() -> NetworkClient{
        return sharedNetwrokClient
    }
    
    public func getData (success : @escaping (Any) -> Void,
                         failure : @escaping (String) -> Void){
        Alamofire.request(URL(string:baseUrl + AppConstants.ApiRout.GET_HOUSE_LIST)!).responseData { (response) in
            switch response.result{
            case .success:
                guard let data = response.result.value else {return}
                success(data)
                break
            case . failure(let err):
                failure(err.localizedDescription)
                break
            }
            
        }
    }
    
    func getDataByHeader(route: String,headers : HTTPHeaders,parameter : Parameters,
                         success : @escaping (Any) -> Void,
                         failure : @escaping (String) -> Void){
        Alamofire.request(AppConstants.BASE_URL+route, method: .get, parameters: parameter, headers: headers).responseData { (response) in
            guard let data = response.result.value else {return}
            
            switch response.result {
            case .success:
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let baseResponse = try
                        decoder.decode(BaseResponse.self, from: data)
                    
                    if baseResponse.isResponseOK() {
                        let json = JSON(response.result.value!)
                        let data = json["data"]
                        success(data)
                    }else{
                        failure("Error")
                    }
                    
                }catch let jsonErr{
                    failure(jsonErr.localizedDescription)
                }
                success(data)
                break
                
            case .failure(let error) :
                failure(error.localizedDescription)
                break
            }
        }
    }
    
    func postFormData(route: String,headers : HTTPHeaders,parameter : Parameters,
                      success : @escaping (Any) -> Void,
                      failure : @escaping (String) -> Void){
        Alamofire.request(AppConstants.BASE_URL+route, method: .post, parameters: parameter, headers: headers).responseData { (response) in
            guard let data = response.result.value else {return}
            
            switch response.result {
            case .success:
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let baseResponse = try
                        decoder.decode(BaseResponse.self, from: data)
                    
                    if baseResponse.isResponseOK() {
                        let json = JSON(response.result.value!)
                        let data = json["data"]
                        success(data)
                    }else{
                        failure("Error")
                    }
                    
                }catch let jsonErr{
                    failure(jsonErr.localizedDescription)
                }
                success(data)
                break
                
            case .failure(let error) :
                failure(error.localizedDescription)
                break
            }
        }
    }
    
    func postRawData(request: URLRequest,
                     success : @escaping (Any) -> Void,
                     failure : @escaping (String) -> Void){
        Alamofire.request(request).responseData { (response) in
            guard let data = response.result.value else {return}
            
            switch response.result {
            case .success:
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    
                    let baseResponse = try
                        decoder.decode(BaseResponse.self, from: data)
                    
                    if baseResponse.isResponseOK() {
                        let json = JSON(response.result.value!)
                        let data = json["data"]
                        success(data)
                    }else{
                        failure("Error")
                    }
                    
                }catch let jsonErr{
                    failure(jsonErr.localizedDescription)
                }
                success(data)
                break
                
            case .failure(let error) :
                failure(error.localizedDescription)
                break
            }
            
        }
    }
}
