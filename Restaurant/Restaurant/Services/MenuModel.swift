//
//  MenuModel.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import CoreData

@MainActor
final class MenuModel: ObservableObject {
    
    @Published var menu: [MenuItem] = []
    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    
    func load(_ coreDataContext: NSManagedObjectContext) async {
        let session = URLSession.shared
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        guard let url else { return }
        
        do {
            let (data, _) = try await session.data(from: url)
            let menuList = try decoder.decode(MenuList.self, from: data)
            menu = menuList.menu
            
            Dish.deleteAll(coreDataContext)
            Dish.createDishesFrom(menu: menu, coreDataContext)
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
