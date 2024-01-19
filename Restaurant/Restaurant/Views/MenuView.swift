//
//  MenuView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var menuModel = MenuModel()
    
    var body: some View {
        VStack {
            Text("Restaurant")
            Text("New York")
            Text("Short description about app")
            Spacer()
            FetchedObjects(
                predicate: NSPredicate(value: true),
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
