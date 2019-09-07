//
//  BaseEntityHandler.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import CoreData
class BaseEntityHandler {
    func create<T: NSManagedObject>(context: NSManagedObjectContext) -> T {
        assert(true, "Method not overidden")
        return NSManagedObject() as! T
    }
}

