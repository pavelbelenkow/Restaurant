//
//  HeroSectionView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 23.01.2024.
//

import SwiftUI

struct HeroSectionView: View {
    
    @State private var isKeyboardVisible = false
    @Binding var searchText: String
    
    let restaurantInfo: RestaurantInfo
    
    var body: some View {
        ZStack {
            VStack {
                if !isKeyboardVisible {
                    RestaurantInfoView(restaurantInfo: restaurantInfo)
                        .transition(.scale(scale: 0, anchor: .top))
                }
                
                TextField("Search dishes...", text: $searchText)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(isKeyboardVisible ? .all : [.leading, .trailing, .bottom])
            .background(.darkBackground)
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
            withAnimation(.spring(duration: 0.5)) {
                self.isKeyboardVisible = true
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
            withAnimation(.spring(duration: 0.5)) {
                self.isKeyboardVisible = false
            }
        }
    }
}

#Preview {
    HeroSectionView(searchText: .constant(""), restaurantInfo: RestaurantInfo.sample)
}
