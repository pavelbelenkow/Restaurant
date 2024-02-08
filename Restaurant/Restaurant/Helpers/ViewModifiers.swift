//
//  ViewModifiers.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 04.02.2024.
//

import SwiftUI

struct PopupViewModifier: ViewModifier {
    
    @ObservedObject var popupModel: PopupViewModel
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottom) {
                if case let .present(dishes, selectedIndex) = popupModel.action {
                    MenuItemsDetailView(dishes: dishes, selectedIndex: selectedIndex)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    withAnimation(.spring) {
                                        if value.translation.height > 100 {
                                            popupModel.dismiss()
                                        }
                                    }
                                }
                        )
                }
            }
            .ignoresSafeArea()
    }
}
