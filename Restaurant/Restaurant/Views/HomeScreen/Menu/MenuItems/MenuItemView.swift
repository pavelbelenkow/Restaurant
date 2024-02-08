//
//  MenuItemView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 18.01.2024.
//

import SwiftUI

struct MenuItemView: View {
    
    let dish: Dish
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(dish.title ?? "")
                    .font(.cardTitle)
                Text(dish.dishDescription ?? "")
                    .font(.paragraph)
                Text("$\(dish.price ?? "")")
                    .font(.cardTitle)
                    .monospaced()
            }
            
            Spacer()
            
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .interpolation(.low)
                    .scaledToFit()
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100)
        }
    }
}

#Preview {
    MenuItemView(dish: .init())
}
