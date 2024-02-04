//
//  Dish+CoreDataProperties.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 18.01.2024.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var category: String?
    @NSManaged public var dishDescription: String?
    @NSManaged public var dishId: UUID?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?
    
}

extension Dish : Identifiable {
    
    private static func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }
    
    static func save(_ context: NSManagedObjectContext) {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
            context.rollback()
        }
    }
    
    static func fetchDish(with uuid: UUID, _ context: NSManagedObjectContext) -> Dish? {
        let request = Dish.fetchRequest()
        let predicate = NSPredicate(format: "dishId == %@", uuid as CVarArg)
        request.predicate = predicate
        
        do {
            let results = try context.fetch(request)
            return results.first
        } catch {
            print("Error fetching dish: \(error)")
            return nil
        }
    }
    
    static func createDishesFrom(menu: [MenuItem], _ context: NSManagedObjectContext) {
        
        for item in menu {
            if let existingDish = Self.fetchDish(with: item.uuid, context) {
                existingDish.title = item.title
                existingDish.dishDescription = item.description
                existingDish.image = item.image
                existingDish.price = item.price
                existingDish.category = item.category
            } else {
                let dish = Dish(context: context)
                dish.dishId = item.uuid
                dish.title = item.title
                dish.dishDescription = item.description
                dish.image = item.image
                dish.price = item.price
                dish.category = item.category
            }
        }
    }
    
    static func deleteAll(_ context: NSManagedObjectContext) {
        let request = Dish.request()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            guard let persistentStoreCoordinator = context.persistentStoreCoordinator else { return }
            try persistentStoreCoordinator.execute(deleteRequest, with: context)
            save(context)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
