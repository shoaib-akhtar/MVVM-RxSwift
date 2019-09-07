//
//  SDAlbumEntityHandler.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
import CoreData
class SDAlbumEntityHandler : BaseEntityHandler{
    
    override func create<T>(context: NSManagedObjectContext) -> T where T : NSManagedObject {
        let obj = SDAlbum(entity: SDAlbum.entity(), insertInto: context)
        return obj as! T
    }
    
    func createOrUpdate(with albums: [Album],completion: @escaping([Album]?) -> Void)  {
        let context = CoreData.shared.workingContext
        context.perform {
            for album in albums{
                if let sdAlbum = SDAlbum.find(withId: Int64(album.id), on: context){
                    sdAlbum.update(with: album)
                }else{
                    let newSdAlbum : SDAlbum = self.create(context: context)
                    newSdAlbum.update(with: album)
                }
            }
            CoreData.shared.saveWorkingContext(context: context)
            completion(self.fetchAll(context: CoreData.shared.managedObjectContext))
        }
    }
    
    func fetchAll(context: NSManagedObjectContext = CoreData.shared.managedObjectContext) -> [Album]? {
        do {
            let request : NSFetchRequest = SDAlbum.fetchRequest()
            let albums = try context.fetch(request)
            let mapedAlbums = albums.map{$0.mapAlbum()}
            return mapedAlbums
        } catch {
            print("Error fetching data from CoreData")
        }
        return nil
    }
}
