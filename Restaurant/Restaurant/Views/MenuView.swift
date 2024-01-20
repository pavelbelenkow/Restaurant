//
//  MenuView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject private var menuModel = MenuModel()
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            Text("Restaurant")
            Text("New York")
            Text("Short description about app")
            Spacer()
            TextField("search...", text: $searchText)
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                    List {
                        ForEach(dishes) { dish in
                            NavigationLink(destination: MenuItemView(dish: dish)) {
                                HStack {
                                    Text(dish.title ?? "")
                                    Text("$\(dish.price ?? "")")
                                        .monospaced()
                                    Spacer()
                                    AsyncImage(url: URL(string: dish.image!)) { image in
                                        image
                                            .resizable()
                                            .interpolation(.low)
                                            .scaledToFit()
                                            .padding()
                                    } placeholder: {
                                        ProgressView()
                                    }

                                }
                            }
                        }
                    }
                }
        }
        .task {
            await menuModel.load(viewContext)
        }
        .refreshable {
            await menuModel.load(viewContext)
        }
    }
    
    private func buildPredicate() -> NSPredicate {
        let predicate: NSPredicate
        
        if searchText.isEmpty {
            predicate = NSPredicate(value: true)
        } else {
            predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        
        return predicate
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString .localizedStandardCompare)
            )
        ]
    }
}

#Preview {
    MenuView()
}
