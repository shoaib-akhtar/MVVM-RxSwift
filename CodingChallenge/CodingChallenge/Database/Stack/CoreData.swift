//
//  CoreData.swift
//  CodingChallenge
//
//  Created by Shoaib Akhtar on 05/09/2019.
//  Copyright © 2019 ShoaibAkhtar. All rights reserved.
//

import Foundation
import CoreData
class CoreData {
    
    static let shared = CoreData()
    
    private init(){
        
    }
    
    var managedObjectContext: NSManagedObjectContext { get {
        return self.persistentContainer.viewContext
        }
    }
    
    var workingContext: NSManagedObjectContext { get {
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.parent = self.managedObjectContext
        return context
        }
    }
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CodingChallenge")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print(error)
                
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        
        self.managedObjectContext.performAndWait {
            if self.managedObjectContext.hasChanges {
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
            }
        }
        
    }
    
    func saveWorkingContext(context: NSManagedObjectContext) {
        do {
            try context.save()
            saveContext()
        } catch (let error) {
            print(error)
        }
    }
    
    
}
