//
//  OnboardingView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 21.01.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage: Int = 0
    @Binding var onboardingCompleted: Bool
    
    private let onboardingPages: [OnboardingPage] = [
        OnboardingPage(title: "Sign Up", imageName: "profileImagePlaceholder", description: "Register and create an account"),
        OnboardingPage(title: "Explore", imageName: "profileImagePlaceholder", description: "Browse and discover dishes for your order"),
        OnboardingPage(title: "Profile Details", imageName: "profileImagePlaceholder", description: "Provide your contact details in your profile")
    ]
    
    private let backgroundColors: [Color] = [
        .darkBackground, .yellowRestaurant, .orangeRestaurant
    ]
    
    var body: some View {
        ZStack {
            let notLastPage = currentPage < onboardingPages.count - 1
            
            backgroundColors[currentPage]
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                ZStack {
                    ForEach(onboardingPages.indices) { index in
                        CircleButton(currentIndex: $currentPage, index: index)
                            .offset(y: index == currentPage ? 0 : 1000)
                            .onTapGesture {
                                withAnimation {
                                    currentPage = index
                                }
                            }
                    }
                }
                .frame(height: 100)
                
                OnboardingPageView(page: onboardingPages[currentPage])
                
                Spacer()
                
                VStack {
                    Button(action: {
                        if notLastPage {
                            withAnimation {
                                currentPage += 1
                            }
                        } else {
                            withAnimation {
                                onboardingCompleted = true
                            }
                        }
                    }) {
                        Text(notLastPage ? "Next" : "Done")
                            .foregroundColor(.white)
                            .padding()
                            .background(notLastPage ? .backgroundRestaurant : .yellowRestaurant)
                            .cornerRadius(8)
                            .padding()
                    }
                    .fullScreenCover(isPresented: $onboardingCompleted) {
                        RegistrationView()
                    }
                    
                    Spacer()
                    
                    Button("Skip") {
                        withAnimation {
                            onboardingCompleted = true
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                }
                .padding()
            }
        }
        .statusBar(hidden: true)
    }
}

#Preview {
    OnboardingView(onboardingCompleted: .constant(false))
}
