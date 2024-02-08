//
//  CircleButton.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 22.01.2024.
//

import SwiftUI

struct CircleButton: View {
    @Binding var currentIndex: Int
    let index: Int
    
    var body: some View {
        Circle()
            .fill(index == currentIndex ? .white : .grayRestaurant)
            .frame(width: 20, height: 20)
    }
}
