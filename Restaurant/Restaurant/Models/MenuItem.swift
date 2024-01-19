//
//  MenuItem.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 15.01.2024.
//

import Foundation

struct MenuItem: Decodable & Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}
