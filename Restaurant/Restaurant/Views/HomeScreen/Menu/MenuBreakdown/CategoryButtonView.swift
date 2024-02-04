//
//  CategoryButtonView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 04.02.2024.
//

import SwiftUI

struct CategoryButtonView: View {
    
    let category: String
    
    @ObservedObject var menuModel: MenuViewModel
    
    var body: some View {
        Button {
            menuModel.toggleCategory(category)
        } label: {
            let isCategorySelected = menuModel.selectedCategories.contains(category)
            
            Text(category)
                .foregroundStyle(.blackRestaurant)
                .font(.sectionCategory)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(isCategorySelected ? .darkGrayRestaurant : .grayRestaurant)
                .cornerRadius(16)
        }
    }
}

#Preview {
    CategoryButtonView(category: "Mains", menuModel: .init())
}
