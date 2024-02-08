//
//  HeaderView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 30.01.2024.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var selectedTab: Int
    
    private var profileImage: Image {
        if let imageData = CredentialsStorage.shared.image,
           let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
        } else {
            Image(.profileImagePlaceholder)
        }
    }
    
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
                    profileImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                }
                .padding(.trailing)
            }
        }
    }
}

#Preview {
    HeaderView(selectedTab: .constant(0))
}
