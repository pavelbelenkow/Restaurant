//
//  TextFieldStyles.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 07.02.2024.
//

import SwiftUI

struct CredentialsTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.darkBackground, lineWidth: 2)
            )
    }
}
