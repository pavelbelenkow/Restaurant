//
//  UserProfileView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import SwiftUI

struct UserProfileView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject private var viewModel: UserCredentialsViewModel
    
    @State private var showActionButtons = false
    
    init(viewModel: UserCredentialsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Personal Information")
                .font(.regular)
            
            ProfileImageView(viewModel: viewModel)
            
            CredentialsForm(viewModel: viewModel)
            
            if showActionButtons {
                ActionButtons(
                    viewModel: viewModel,
                    showActionButtons: $showActionButtons
                )
            }
            
            Spacer()
            
            LogOutButton(presentation: _presentation, viewModel: viewModel)
        }
        .onChange(of: [
            viewModel.userCredentials.firstName,
            viewModel.userCredentials.lastName,
            viewModel.userCredentials.email
        ]) { _, _ in
            withAnimation(.spring) {
                showActionButtons = viewModel.hasChanges()
            }
        }
        .alert(isPresented: $viewModel.showRegisterInvalidMessage, content: {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        })
    }
}

#Preview {
    UserProfileView(viewModel: .init())
}
