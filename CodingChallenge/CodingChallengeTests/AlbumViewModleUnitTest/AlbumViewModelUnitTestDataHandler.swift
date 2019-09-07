//
//  AlbumViewModelUnitTestDataHandler.swift
//  CodingChallengeTests
//
//  Created by Shoaib Akhtar on 07/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//
import XCTest
@testable import CodingChallenge

class AlbumViewModelUnitTestDataHandler: DataHandler {
    override func getAndSaveDataInDb(completion: @escaping (Result<[Album], APIError>) -> Void) {
        service.getAlbums { (result) in
            switch result{
            case .success(let albums):
                if albums.first?.title == "accusamus beatae ad facilis cum similique qui sunt"{
                    completion(.success(albums))
                }else{
                    XCTAssert(false, "Invalid data")
                    completion(.failure(APIError.init(statusCode: .unknown, error: [nil])))
                }
            case .failure(let error):
                XCTAssert(false, "Invalid data")
                completion(.failure(error))
            }
        }
    }
}
