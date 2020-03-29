//
//  API.swift
//  Covid19
//
//  Created by Solayman Rana on 24/3/20.
//  Copyright © 2020 Solayman Rana. All rights reserved.
//

import Foundation
import Combine

class Api {
    
    
    
    func fetchData() -> AnyPublisher<Latest,Error> {

        let url = "https://coronavirus-tracker-api.herokuapp.com/v2/latest"
        
        guard let dataUrl = URL(string: url) else {
            fatalError("Invalid Url")
        }
        
       return URLSession.shared.dataTaskPublisher(for: dataUrl)
            .map {$0.data}
            .decode(type: RPdata.self, decoder: JSONDecoder())
            .map{$0.latest!}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//
//    class func getResponseStatus(isSuccess: Bool, responseCode : Int, msg: String)-> ResponseStatus {
//              return ResponseStatus(isSuccess: isSuccess, resCode : responseCode, msg: msg)
//          }
//    //    class func getData(){
//    //
//    //        var request = URLRequest(url: URL(string: "https://coronavirus-tracker-api.herokuapp.com/v2/locations")!)
//    //        request.httpMethod = "GET"
//    //
//    //        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
//    //            do {
//    //                let jsonDecoder = JSONDecoder()
//    //                let responseModel = try jsonDecoder.decode(RPdata.self, from: data!)
//    //                print(responseModel)
//    //            } catch {
//    //                print("JSON Serialization error")
//    //            }
//    //        }).resume()
//    //    }
//    //
//    //
//    class func getCases(customerID: Int,  completionHandler : @escaping(_ rpProductsByCategory :RPdata1?, _ status: ResponseStatus) -> ()){
//
//
//
//        let consumer_key = "ck_446397b437656a5343676f11f5f11f295ecafd57"
//        let consumer_secret = "cs_d3fe68b464873db13ebcef74e17e61a2ece9bc4c"
//
//        let url = "https://coronavirus-tracker-api.herokuapp.com/v2/locations"
//        print(url)
//        var urlRequest = URLRequest(url: URL(string: url)!)
//        urlRequest.httpMethod = HTTPMethod.get.rawValue
//        //urlRequest.cachePolicy = .returnCacheDataElseLoad
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        let request = Alamofire.request(urlRequest)
//            .validate(statusCode: 200..<201)
//            .validate(contentType: ["application/json"])
//
//        request.responseObject{ (response: DataResponse<RPdata1>) in
//            switch response.result{
//            case .success(let rpUser):
//                //let json = Mapper().toJSON(rpProductsByCategory)
//                //print(json)
//                print("Response success getAddress")
//                completionHandler(rpUser,getResponseStatus(isSuccess: true, responseCode: 200, msg: ""))
//                break
//
//            case .failure(let error):
//                print(error)
//                if error._code == NSURLErrorTimedOut {
//                    completionHandler(nil,getResponseStatus(isSuccess: true, responseCode: Constants.RESPONSE_CODE_NETWORK_TIMEOUT, msg: "Please check your internet Connection"))
//                }else{
//                    if response.response == nil{
//                        completionHandler(nil,getResponseStatus(isSuccess: false, responseCode: 0, msg: "something went wrong"))
//                    }else{
//                        let responseCode : Int = (response.response?.statusCode)!
//                        if responseCode == Constants.RESPONSE_CODE_NO_DATA_FOUND{
//                            //print("API: \(responseCode)")
//                            completionHandler(nil,getResponseStatus(isSuccess: false, responseCode: responseCode, msg: "No data Found"))
//                        }else{
//                            completionHandler(nil,getResponseStatus(isSuccess: false, responseCode: responseCode, msg: "Some thing went wrong"))
//                        }
//                    }
//                }
//                break
//            }
//        }
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}
