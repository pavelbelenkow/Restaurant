//
//  RegistrationFormView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 22.01.2024.
//

import SwiftUI

struct RegistrationFormView: View {
    @ObservedObject var viewModel: RegistrationFormViewModel
    
    private let credentialsStorage = CredentialsStorage.shared

    var body: some View {
        VStack {
            NavigationLink(
                destination: HomeView(),
                isActive: $viewModel.userCredentials.isLoggedIn
            ) {
                EmptyView()
            }
            
            TextField("First Name", text: $viewModel.userCredentials.firstName)
            TextField("Last Name", text: $viewModel.userCredentials.lastName)
            TextField("Email", text: $viewModel.userCredentials.email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            Button("Register") {
                viewModel.validateRegister()
            }
        }
        .padding()
        .textFieldStyle(.roundedBorder)
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
