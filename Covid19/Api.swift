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
    
    func fetchData1() -> AnyPublisher<Latest,Error> {
        
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
    
    func fetchData2() -> AnyPublisher<Latest,Error> {
        
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
    
    func fetchData3() -> AnyPublisher<RPdata,Error> {
        
        let url = "https://coronavirus-tracker-api.herokuapp.com/v2/locations"
        
        guard let dataUrl = URL(string: url) else {
            fatalError("Invalid Url")
        }
        
        return URLSession.shared.dataTaskPublisher(for: dataUrl)
            .map {$0.data}
            .decode(type: RPdata.self, decoder: JSONDecoder())
            .map{$0.self}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    
    enum APIError: Error, LocalizedError {
        case unknown, apiError(reason: String)

        var errorDescription: String? {
            switch self {
            case .unknown:
                return "Unknown error"
            case .apiError(let reason):
                return reason
            }
        }
    }

    func fetch(url: URL) -> AnyPublisher<Data, APIError> {
        let request = URLRequest(url: url)

        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.unknown
                }
                return data
            }
            .mapError { error in
                if let error = error as? APIError {
                    return error
                } else {
                    return APIError.apiError(reason: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
    
}
