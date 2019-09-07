//
//  AlbumServiceUnitTest.swift
//  CodingChallengeTests
//
//  Created by Shoaib Akhtar on 07/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import XCTest
@testable import CodingChallenge

class AlbumServiceUnitTest: AlbumService {
    override func getAlbums(completion: @escaping (Result<[Album], APIError>) -> Void) {
        let bundle = Bundle(for: AlbumServiceUnitTest.self)
        if let path = bundle.path(forResource: "albums", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let albums : [Album] = data.deserialized(){
                    completion(.success(albums))
                }else {
                    XCTAssert(false, "Unable to parse")
                }
            } catch {
                XCTAssert(false, "No data found")
                completion(.failure(APIError.init(statusCode: .unknown, error: [nil])))
            }
        }else{
            XCTAssert(false, "No data found")
            completion(.failure(APIError.init(statusCode: .unknown, error: [nil])))
        }
    }
}
