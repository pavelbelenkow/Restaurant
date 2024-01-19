//
//  UserProfileView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.presentationMode) var presentation
    private let credentials = CredentialsStorage.shared
    
    var body: some View {
        VStack {
            Text("Personal Information")
            Image(.profileImagePlaceholder)
            Text("\(credentials.firstName ?? "") \(credentials.lastName ?? "")")
            Text(credentials.email ?? "")
            
            Button("Logout") {
                credentials.isLoggedIn.toggle()
                credentials.removeCredentials()
                self.presentation.wrappedValue.dismiss()
            }
            
            Spacer()
        }
    }
}

#Preview {
    UserProfileView()
}
