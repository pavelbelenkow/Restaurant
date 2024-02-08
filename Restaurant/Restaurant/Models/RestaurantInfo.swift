//
//  RestaurantInfo.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 23.01.2024.
//

import Foundation

struct RestaurantInfo {
    let name: String
    let city: String
    let description: String
    
    static let sample = RestaurantInfo(
        name: "Little Lemon",
        city: "New York",
        description: "We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist."
    )
}
