//
//  MenuItemDetailView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 04.02.2024.
//

import SwiftUI

struct MenuItemDetailView: View {
    
    let dish: Dish
    
    var body: some View {
        VStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 36, height: 6)
                .foregroundStyle(.grayRestaurant)
            
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                ImageViewerView(image: image)
            } placeholder: {
                ProgressView()
            }
            .frame(maxHeight: .infinity)
            .zIndex(1)
            
            Text(dish.title ?? "")
                .font(.cardTitle)
                .foregroundColor(.black)
            
            Text(dish.dishDescription ?? "")
                .font(.paragraph)
                .foregroundColor(.black)
            
            Spacer()
            
            AddToOrderButtonView()
            
            Spacer()
        }
        .padding()
        .containerRelativeFrame([.horizontal, .vertical], alignment: .center)
        .scrollTransition(.animated, axis: .horizontal) { content, phase in
            content
                .opacity(phase.isIdentity ? 1.0 : 0.8)
                .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
        }
    }
}

#Preview {
    MenuItemDetailView(dish: .init())
}
