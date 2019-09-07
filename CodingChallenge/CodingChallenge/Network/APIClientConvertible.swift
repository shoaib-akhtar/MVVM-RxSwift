//
//  APIClientConvertible.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 04/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Alamofire

protocol APIClientConvertible {
    
    func performRequest(route: URLRequestConvertible, completion:@escaping (Result<Data?,APIError>) -> Void)
    
}

protocol AppURLRequestConvertible: URLRequestConvertible {}
