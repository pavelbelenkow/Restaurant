//
//  RegistrationView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 14.01.2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject private var viewModel = UserCredentialsViewModel()
    
    var body: some View {
        NavigationView {
            RegistrationFormView(viewModel: viewModel)
        }
    }
}

#Preview {
    RegistrationView()
}
