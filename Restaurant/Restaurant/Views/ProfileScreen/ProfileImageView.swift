//
//  ProfileImageView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 07.02.2024.
//

import SwiftUI
import PhotosUI

struct ProfileImageView: View {
    
    @ObservedObject var viewModel: UserCredentialsViewModel
    
    @State private var profileItem: PhotosPickerItem?
    
    private var profileImage: Image {
        if let imageData = CredentialsStorage.shared.image,
           let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
        } else {
            Image(.profileImagePlaceholder)
        }
    }
    
    var body: some View {
        profileImage
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(maxWidth: 150, maxHeight: 150)
            .overlay(alignment: .center) {
                PhotosPicker(
                    selection: $profileItem,
                    matching: .images
                ) {
                    Circle()
                        .foregroundStyle(.clear)
                        .frame(maxWidth: 150, maxHeight: 150)
                }
            }
            .onChange(of: profileItem) {
                Task {
                    if let loaded = try? await profileItem?.loadTransferable(type: Data.self) {
                        viewModel.saveImage(loaded)
                    } else {
                        print("Failed to load data")
                    }
                }
            }
    }
}

#Preview {
    ProfileImageView(viewModel: .init())
}
