//
//  Album.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 04/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
struct Album: Codable {
    let albumId : Int
    let id : Int
    let title : String
    let url : URL?
    let thumbnailUrl : URL?
}

class DataHandler {

    let service : AlbumService
    private lazy var entityHandler = {SDAlbumEntityHandler()}()
    init(service: AlbumService) {
        self.service = service
    }
    func getAndSaveDataInDb(completion:@escaping(Result<[Album],APIError>) -> Void) {
        if let localItems = entityHandler.fetchAll(), !localItems.isEmpty{
            completion(.success(localItems))
        }
        
        service.getAlbums { (result) in
            switch result{
            case .success(let albums):
                self.entityHandler.createOrUpdate(with: albums, completion: { (albums) in
                    if let albums = albums{
                        completion(.success(albums))
                    }else {
                        completion(.failure(APIError(statusCode: .unknown, error: ["Error"])))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

