//
//  HeaderView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 30.01.2024.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Image(.restaurantLogo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 185, height: 40)
            
            HStack {
                Spacer()
                
                Button {
                    selectedTab = 1
                } label: {
                    Image(.profileImagePlaceholder)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 44, height: 44)
                        .clipShape(Circle())
                }
                .padding(.trailing)
            }
        }
    }
}

#Preview {
    HeaderView(selectedTab: .constant(0))
}
