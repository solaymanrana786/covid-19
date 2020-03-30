//
//  ViewModel.swift
//  Covid19
//
//  Created by Solayman Rana on 30/3/20.
//  Copyright © 2020 Solayman Rana. All rights reserved.
//



import Foundation
import Combine

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

