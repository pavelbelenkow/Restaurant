//
//  Font+Extensions.swift
//  Restaurant
//
//  Created by Pavel Belenkow on 22.01.2024.
//

import SwiftUI

extension Font {
    static let display: Font = .custom("Markazi Text", size: 64).weight(.medium)
    static let subtitle: Font = .custom("Markazi Text", size: 48).weight(.medium)
    static let regular: Font = .custom("Markazi Text", size: 40).weight(.regular)
    static let leading: Font = .custom("Karla", size: 18).weight(.medium)
    static let sectionTitle: Font = .custom("Karla", size: 20).weight(.heavy)
    static let sectionCategory: Font = .custom("Karla", size: 16).weight(.heavy)
    static let cardTitle: Font = .custom("Karla", size: 18).weight(.bold)
    static let paragraph: Font = .custom("Karla", size: 16).weight(.regular)
    static let highlight: Font = .custom("Karla", size: 16).weight(.medium)
}
