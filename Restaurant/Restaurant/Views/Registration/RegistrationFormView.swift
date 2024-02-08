//
//  RegistrationFormView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 22.01.2024.
//

import SwiftUI

struct RegistrationFormView: View {
    
    @ObservedObject var viewModel: UserCredentialsViewModel
    
    private let credentialsStorage = CredentialsStorage.shared

    var body: some View {
        VStack {
            NavigationLink(
                destination: HomeView(credentialsModel: viewModel),
                isActive: $viewModel.userCredentials.isLoggedIn
            ) {
                EmptyView()
            }
            
            CredentialsForm(viewModel: viewModel)
            
            Button("Register") {
                viewModel.processCredentials()
            }
        }
        .alert(isPresented: $viewModel.showRegisterInvalidMessage, content: {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        })
        .onAppear {
            if credentialsStorage.isLoggedIn {
                viewModel.userCredentials.isLoggedIn.toggle()
            }
        }
    }
}

#Preview {
    RegistrationFormView(viewModel: .init())
}
