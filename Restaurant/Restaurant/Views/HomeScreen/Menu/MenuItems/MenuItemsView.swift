//
//  MenuItemsView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 23.01.2024.
//

import SwiftUI

struct MenuItemsView: View {
    
    @ObservedObject var menuModel: MenuViewModel
    @ObservedObject var popupModel: PopupViewModel
    
    var searchText: String
    
    var body: some View {
        FetchedObjects(
            predicate: menuModel.buildPredicate(with: searchText,
                                                selectedCategories: menuModel.selectedCategories),
            sortDescriptors: menuModel.buildSortDescriptors()
        ) { (dishes: [Dish]) in
            LazyVStack {
                ForEach(dishes.indices, id: \.self) { index in
                    let dish = dishes[index]
                    
                    MenuItemView(dish: dish)
                        .onTapGesture {
                            withAnimation(.spring) {
                                popupModel.present(with: dishes, selectedIndex: index)
                            }
                        }
                    
                    Divider()
                }
                .padding([.horizontal, .bottom])
            }
        }
    }
}

#Preview {
    MenuItemsView(menuModel: .init(), popupModel: .init(), searchText: "")
}
