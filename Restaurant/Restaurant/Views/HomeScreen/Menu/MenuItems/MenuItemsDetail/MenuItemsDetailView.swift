//
//  MenuItemsDetailView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 04.02.2024.
//

import SwiftUI

struct MenuItemsDetailView: View {
    
    let dishes: [Dish]
    let selectedIndex: Int
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(dishes.indices, id: \.self) { index in
                        let dish = dishes[index]
                        MenuItemDetailView(dish: dish)
                    }
                }
                .scrollTargetLayout()
                .onChange(of: selectedIndex, initial: true) { _, _ in
                    scrollView.scrollTo(selectedIndex)
                }
            }
            .multilineTextAlignment(.center)
            .scrollTargetBehavior(.paging)
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2)
            .background(
                Color.white
                    .clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20))
                    .shadow(color: .black.opacity(0.2), radius: 15, x: 0, y: 2)
                    .overlay(
                        Color.white
                            .clipShape(.rect(topLeadingRadius: 20, topTrailingRadius: 20))
                    )
            )
        }
        .transition(.move(edge: .bottom))
    }
}

#Preview {
    MenuItemsDetailView(dishes: [], selectedIndex: 0)
}
