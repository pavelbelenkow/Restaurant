//
//  HomeView.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            MenuView()
                .tabItem { Label("Menu", systemImage: "list.dash") }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}
