//
//  RestaurantApp.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 12.01.2024.
//

import SwiftUI

@main
struct RestaurantApp: App {
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .onTapGesture {
                    UIApplication.shared.sendAction(
                        #selector(UIResponder.resignFirstResponder),
                        to: nil,
                        from: nil,
                        for: nil
                    )
                }
        }
    }
}
