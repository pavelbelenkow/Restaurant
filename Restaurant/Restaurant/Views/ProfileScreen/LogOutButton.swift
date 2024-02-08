//
//  LogOutButton.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 07.02.2024.
//

import SwiftUI

struct LogOutButton: View {
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var viewModel: UserCredentialsViewModel
    
    var body: some View {
        Button(action: {
            viewModel.logout()
            self.presentation.wrappedValue.dismiss()
        }) {
            Text("Log Out")
                .foregroundStyle(.white)
                .font(.sectionCategory)
                .frame(width: UIScreen.main.bounds.width / 2, height: 48)
                .background(.darkBackground)
                .cornerRadius(16)
                .padding()
        }
    }
}

#Preview {
    LogOutButton(viewModel: .init())
}
