//
//  APIEnums.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 04/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
struct Codes {
    enum statusCode : Int  {
        case unknown = -1
        case informational = 100
        case success = 200
        case redirection = 300
        case clientError = 400
        case unauthorize = 401
        case outofSync = 409
        case serverError = 500
        case deserialize
        
        static func value(code : Int) -> statusCode {
            switch code {
            case -1:
                return .unknown
            case 100 ... 199:
                return .informational
            case 200 ... 299:
                return .success
            case 300 ... 399:
                return .redirection
            case 400 ... 499:
                return .clientError
            case 500 ... 599:
                return .serverError
            default:
                return .deserialize
            }
        }
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case userAgent = "User-Agent"
    case acceptLanguage = "Accept-Language"
    case appVersion = "App-Version"
}

enum ContentType: String {
    case json = "application/json"
    case xwwwFormURLEncoded = "application/x-www-form-urlencoded"
    case multiPartFormData = "multipart/form-data"
}
