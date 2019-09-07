//
//  APIClient.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 04/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Alamofire

enum APPHTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

struct APIClient: APIClientConvertible {
    
    private var session = Session()
    
    init() {
        let configuration = URLSessionConfiguration.default
        session = Session(configuration: configuration)
    }
    
    func performRequest(route: URLRequestConvertible, completion: @escaping (Result<Data?,APIError>) -> Void) {
        self.perform(route: route, completion: completion)
    }
}


// Private methods
extension APIClient {
    private func perform(route: URLRequestConvertible, completion: @escaping (Result<Data?,APIError>) -> Void) {
        
        session.request(route).responseData { (data) in
            
            if let response = data.response{
                let statusCode = Codes.statusCode.value(code: response.statusCode)
                
                switch statusCode{
                case .success:
                    completion(.success(data.value))
                default:
                    completion(.failure(APIError(statusCode: statusCode, error: [data.error?.localizedDescription])))
                }
                
            }else{
                completion(.failure(APIError.init(statusCode: .unknown, error: [data.error?.localizedDescription])))
            }
        }
    }
    
    
}
