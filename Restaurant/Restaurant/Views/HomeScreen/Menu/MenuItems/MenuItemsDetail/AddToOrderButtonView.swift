//
//  AddToOrderButtonView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 04.02.2024.
//

import SwiftUI

struct AddToOrderButtonView: View {
    
    @State private var isAddingToOrder = false
    @State private var isAddedToOrder = false

    var body: some View {
        Button(action: {
            self.handleButtonTap()
        }) {
                HStack {
                    if isAddingToOrder {
                        ProgressView()
                    } else if isAddedToOrder {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.yellowRestaurant)
                        Text("Added")
                    } else {
                        Text("Add To Order")
                    }
                }
                .foregroundStyle(.white)
                .font(.sectionCategory)
                .frame(width: 120, height: 48)
                .background(isAddedToOrder ? .darkBackground : .yellowRestaurant)
                .cornerRadius(16)
        }
        .disabled(isAddingToOrder || isAddedToOrder)
    }
}

private extension AddToOrderButtonView {
    
    func handleButtonTap() {
        isAddingToOrder = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isAddingToOrder = false
            isAddedToOrder = true
        }
    }
}

#Preview {
    AddToOrderButtonView()
}
