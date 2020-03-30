//
//  API.swift
//  Covid19
//
//  Created by Solayman Rana on 24/3/20.
//  Copyright © 2020 Solayman Rana. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class Api {
    
    class func getResponseStatus(isSuccess: Bool, responseCode : Int, msg: String)-> ResponseStatus {
        return ResponseStatus(isSuccess: isSuccess, resCode : responseCode, msg: msg)
    }
    
    class func getCases(customerID: Int,  completionHandler : @escaping(_ rpProductsByCategory :RPdata1?, _ status: ResponseStatus) -> ()){
        
        let url = "https://coronavirus-tracker-api.herokuapp.com/v2/locations" 
        print(url)
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        //urlRequest.cachePolicy = .returnCacheDataElseLoad
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let request = Alamofire.request(urlRequest)
            .validate(statusCode: 200..<201)
            .validate(contentType: ["application/json"])
        
        request.responseObject{ (response: DataResponse<RPdata1>) in
            switch response.result{
            case .success(let rpUser):
                //let json = Mapper().toJSON(rpProductsByCategory)
                //print(json)
                print("Response success getAddress")
                completionHandler(rpUser,getResponseStatus(isSuccess: true, responseCode: 200, msg: ""))
                break
                
            case .failure(let error):
                print(error)
                if error._code == NSURLErrorTimedOut {
                    completionHandler(nil,getResponseStatus(isSuccess: true, responseCode: Constants.RESPONSE_CODE_NETWORK_TIMEOUT, msg: "Please check your internet Connection"))
                }else{
                    if response.response == nil{
                        completionHandler(nil,getResponseStatus(isSuccess: false, responseCode: 0, msg: "something went wrong"))
                    }else{
                        let responseCode : Int = (response.response?.statusCode)!
                        if responseCode == Constants.RESPONSE_CODE_NO_DATA_FOUND{
                            //print("API: \(responseCode)")
                            completionHandler(nil,getResponseStatus(isSuccess: false, responseCode: responseCode, msg: "No data Found"))
                        }else{
                            completionHandler(nil,getResponseStatus(isSuccess: false, responseCode: responseCode, msg: "Some thing went wrong"))
                        }
                    }
                }
                break
            }
        }
    }
}

