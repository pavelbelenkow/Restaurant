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
        OnboardingPage(title: "Discover", imageName: "searchDishes", description: "Use search field to browse different dishes"),
        OnboardingPage(title: "Explore", imageName: "browseDetailedDish", description: "Tap on dish to see details about it"),
        OnboardingPage(title: "Update", imageName: "updateProfileInfo", description: "Update photo, first or last name, or email in your profile")
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
                
                ZStack {
                    ForEach(onboardingPages.indices, id: \.self) { index in
                        CircleButton(currentIndex: $currentPage, index: index)
                            .padding(.top, 30)
                            .offset(y: index == currentPage ? 0 : 1000)
                            .onTapGesture {
                                withAnimation {
                                    currentPage = index
                                }
                            }
                    }
                }
                .frame(height: 50)
                
                OnboardingPageView(page: onboardingPages[currentPage])
                    .padding()
                
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
