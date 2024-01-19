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
    @NSManaged public var dishId: String?
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
    
    static func exists(title: String, price: String, _ context: NSManagedObjectContext) -> Bool {
        let request = Dish.request()
        let titlePredicate = NSPredicate(format: "title == %@", title)
        let pricePredicate = NSPredicate(format: "price == %@", price)
        request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [titlePredicate, pricePredicate])
        
        do {
            let results = try context.fetch(request) as? [Dish]
            
            print("Fetch results count: \(String(describing: results?.count))")
            return results?.isEmpty == false
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    static func createDishesFrom(menu: [MenuItem], _ context: NSManagedObjectContext) {
        
        for item in menu {
            if !(Self.exists(title: item.title, price: item.price, context)) {
                print("Adding dish with ID: \(item.id)")
                let dish = Dish(context: context)
                dish.title = item.title
                dish.dishDescription = item.description
                dish.dishId = String(item.id)
                dish.image = item.image
                dish.price = item.price
                dish.category = item.category
            } else {
                print("Duplicate dish found with title: \(item.title), price: \(item.price)")
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
