//
//  OnboardingPageView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 22.01.2024.
//

import SwiftUI

struct OnboardingPageView: View {
    let page: OnboardingPage
    
    var body: some View {
        VStack(spacing: 12) {
            
            Text(page.title)
                .font(.subtitle)
                .foregroundStyle(.white)
            
            Image(page.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height / 2)
                .cornerRadius(16)
            
            Text(page.description)
                .font(.leading)
                .foregroundStyle(.white)
                .frame(height: 45, alignment: .center)
                .multilineTextAlignment(.center)
        }
    }
}
