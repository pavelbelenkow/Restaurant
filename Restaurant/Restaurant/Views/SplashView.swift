//
//  SplashView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 22.01.2024.
//

import SwiftUI

struct SplashView: View {
    @AppStorage("onboardingCompleted") var onboardingCompleted: Bool = false
    
    var body: some View {
        if onboardingCompleted {
            RegistrationView()
        } else {
            OnboardingView(onboardingCompleted: $onboardingCompleted)
        }
    }
}

#Preview {
    SplashView()
}
