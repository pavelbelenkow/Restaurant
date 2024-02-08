//
//  MenuModel.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import CoreData

@MainActor
final class MenuViewModel: ObservableObject {
    
    @Published var menu: [MenuItem] = []
    @Published var selectedCategories: Set<String> = []
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    func load(_ coreDataContext: NSManagedObjectContext) async {
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        guard let url else { return }
        
        do {
            let (data, _) = try await session.data(from: url)
            let menuList = try decoder.decode(MenuList.self, from: data)
            menu = menuList.menu
            
            Dish.createDishesFrom(menu: menu, coreDataContext)
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

extension MenuViewModel {
    
    func buildPredicate(with searchText: String, selectedCategories: Set<String>) -> NSPredicate {
        var predicates: [NSPredicate] = []
        
        if !searchText.isEmpty {
            let titlePredicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
            predicates.append(titlePredicate)
        }
        
        if !selectedCategories.isEmpty {
            let lowercaseCategories = selectedCategories.map { $0.lowercased() }
            let categoryPredicate = NSPredicate(format: "category IN %@", lowercaseCategories)
            predicates.append(categoryPredicate)
        }
        
        return NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString.localizedStandardCompare)
            )
        ]
    }
    
    func toggleCategory(_ category: String) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
    }
}
