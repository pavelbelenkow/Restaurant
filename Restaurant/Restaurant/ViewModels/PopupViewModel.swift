//
//  PopupViewModel.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 04.02.2024.
//

import SwiftUI

final class PopupViewModel: ObservableObject {
    
    enum Action {
        case nonAvailable
        case present(dishes: [Dish], selectedIndex: Int)
        case dismiss
    }
    
    @Published private(set) var action: Action = .nonAvailable
}

extension PopupViewModel.Action {
    
    var isPresented: Bool {
        guard case .present(_, _) = self else { return false }
        return true
    }
}

extension PopupViewModel {
    
    func present(with dishes: [Dish], selectedIndex: Int) {
        guard !action.isPresented else { return }
        self.action = .present(dishes: dishes, selectedIndex: selectedIndex)
    }
    
    func dismiss() {
        guard case .present(_, _) = action else { return }
        action = .dismiss
    }
}
