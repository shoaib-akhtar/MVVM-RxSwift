//
//  AlbumService.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 04/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
class AlbumService {
    private let apiConvertible = APIClient()
    
    func getAlbums(completion: @escaping(Result<[Album],APIError>) -> Void) {
        
        apiConvertible.performRequest(route: AllbumApiRouter.getPhotos(GetRequest())) { (result) in
            switch result{
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                if let data = data, let albums : [Album] = data.deserialized(){
                    completion(.success(albums))
                }else{
                    completion(.failure(APIError(statusCode: .deserialize, error: ["Unable to deserlize data"])))
                }
            }
        }
    }
    
}
