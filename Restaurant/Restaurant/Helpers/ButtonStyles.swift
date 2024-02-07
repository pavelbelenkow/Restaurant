//
//  ButtonStyles.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 07.02.2024.
//

import SwiftUI

struct ConfirmButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .font(.sectionCategory)
            .frame(maxWidth: .infinity, minHeight: 48)
            .background(.yellowRestaurant)
            .cornerRadius(16)
    }
}

struct DiscardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.darkGrayRestaurant)
            .font(.sectionCategory)
            .frame(maxWidth: .infinity, minHeight: 48)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.darkGrayRestaurant, lineWidth: 2)
            )
    }
}
