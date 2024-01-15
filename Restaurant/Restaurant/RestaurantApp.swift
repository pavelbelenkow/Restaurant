//
//  RestaurantApp.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 12.01.2024.
//

import SwiftUI

@main
struct RestaurantApp: App {
    private let credentialsStorage = CredentialsStorage.shared
    
    var body: some Scene {
        WindowGroup {
            if let _ = credentialsStorage.firstName {
                HomeView()
            } else {
                OnboardingView()
            }
        }
    }
}
