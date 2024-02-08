//
//  PersistenceController.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Restaurant")
        container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores(completionHandler: { _, _ in })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
