//
//  RestaurantInfoView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 04.02.2024.
//

import SwiftUI

struct RestaurantInfoView: View {
    
    let restaurantInfo: RestaurantInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: -20) {
            VStack(alignment: .leading, spacing: -15) {
                Text(restaurantInfo.name)
                    .font(.display)
                    .foregroundStyle(.yellowRestaurant)
                
                Text(restaurantInfo.city)
                    .font(.subtitle)
                    .foregroundStyle(.white)
            }
            
            HStack {
                Text(restaurantInfo.description)
                    .font(.leading)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.trailing, 16)
                
                Image(.hero)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 140, maxHeight: 170)
                    .cornerRadius(15)
            }
        }
    }
}

#Preview {
    RestaurantInfoView(restaurantInfo: .sample)
}
