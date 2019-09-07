//
//  SDAlbum+CoreDataClass.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//
//

import Foundation
import CoreData

@objc(SDAlbum)
public class SDAlbum: NSManagedObject {
    
    func update(with album: Album) {
        self.id = Int64(album.id)
        self.albumId = Int64(album.albumId)
        self.title = album.title
        self.url = album.url
        self.thumbnailUrl = album.thumbnailUrl
    }
    
    static func find(withId id: Int64, on context: NSManagedObjectContext) -> SDAlbum? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: self.entity().name!)
        let predicate = NSPredicate(format: "id = %d", id)
        request.predicate = predicate
        do {
            
            if let results = try context.fetch(request) as? [SDAlbum]{
                if results.count > 0 {
                    return results.first
                }
            }
        } catch {
            print("SDAlbum does not exist")
        }
        return nil
    }
    
    func mapAlbum() -> Album {
        return Album(albumId: Int(albumId), id: Int(id), title: title ?? "", url: url, thumbnailUrl: thumbnailUrl)
    }
}

