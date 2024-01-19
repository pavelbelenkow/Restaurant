//
//  MenuItemView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 18.01.2024.
//

import SwiftUI

struct MenuItemView: View {
    var dish: Dish
    
    var body: some View {
        VStack {
            Text(dish.dishDescription ?? "")
        }
        .navigationTitle(dish.title ?? "")
    }
}
