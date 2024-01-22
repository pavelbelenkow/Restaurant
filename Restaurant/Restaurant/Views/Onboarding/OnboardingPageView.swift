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
        
        // Title
        Text(page.title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
        
        // Image
        Image(page.imageName)
            .resizable()
            .scaledToFit()
            .padding()
        
        // Description
        Text(page.description)
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .padding()
    }
}
