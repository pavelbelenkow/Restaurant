//
//  View+Extensions.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 04.02.2024.
//

import SwiftUI

extension View {
    func popup(with model: PopupViewModel) -> some View {
        self.modifier(PopupViewModifier(popupModel: model))
    }
}
