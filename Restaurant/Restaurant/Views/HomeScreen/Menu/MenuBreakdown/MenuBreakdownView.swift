//
//  MenuBreakdownView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 23.01.2024.
//

import SwiftUI

struct MenuBreakdownView: View {
    
    @ObservedObject var menuModel: MenuViewModel
    
    private let categories = ["Starters", "Mains", "Desserts", "Sides"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Order for Delivery")
                .font(.sectionTitle)
                .foregroundStyle(.blackRestaurant)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        CategoryButtonView(category: category, menuModel: menuModel)
                    }
                }
            }
            
            Divider()
        }
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    MenuBreakdownView(menuModel: .init())
}
