//
//  CredentialsForm.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 07.02.2024.
//

import SwiftUI

struct CredentialsForm: View {
    
    @ObservedObject var viewModel: UserCredentialsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("First Name")
            TextField("", text: $viewModel.userCredentials.firstName)
            
            Text("Last Name")
            TextField("", text: $viewModel.userCredentials.lastName)
            
            Text("Email")
            TextField("", text: $viewModel.userCredentials.email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
        }
        .textFieldStyle(CredentialsTextFieldStyle())
        .padding()
    }
}

#Preview {
    CredentialsForm(viewModel: .init())
}
