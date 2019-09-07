//
//  AllbumApiRouter.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 04/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
enum AllbumApiRouter<T>: AppURLRequestConvertible where T: Codable {
    case getPhotos(T)
    
    private var method: APPHTTPMethod {
        switch self {
        case .getPhotos:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getPhotos:
            return "https://jsonplaceholder.typicode.com/photos"
        }
    }
    
    private var parameters: T? {
       return nil
    }
    
    private var header: String {
        return ContentType.json.rawValue
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try path.asURL()
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        urlRequest.setValue(header, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        if let parameters = parameters {
            do {
                let encodedData = try JSONEncoder().encode(parameters)
                urlRequest.httpBody = encodedData
            } catch let error {
                throw error
            }
        }
        return urlRequest
    }
    
    
}

