//
//  SDAlbum+CoreDataProperties.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//
//

import Foundation
import CoreData


extension SDAlbum {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SDAlbum> {
        return NSFetchRequest<SDAlbum>(entityName: "SDAlbum")
    }

    @NSManaged public var albumId: Int64
    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var url: URL?
    @NSManaged public var thumbnailUrl: URL?

}
