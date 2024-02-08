//
//  ActionButtons.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 07.02.2024.
//

import SwiftUI

struct ActionButtons: View {
    
    @ObservedObject var viewModel: UserCredentialsViewModel
    
    @Binding var showActionButtons: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            Button("Discard") {
                viewModel.resetChanges()
                showActionButtons.toggle()
                hideKeyboard()
            }
            .buttonStyle(DiscardButtonStyle())
            
            Button("Confirm") {
                viewModel.processCredentials()
                showActionButtons.toggle()
                hideKeyboard()
            }
            .buttonStyle(ConfirmButtonStyle())
        }
        .transition(.move(edge: .bottom))
        .padding()
    }
}

private extension ActionButtons {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

#Preview {
    ActionButtons(viewModel: .init(), showActionButtons: .constant(true))
}
