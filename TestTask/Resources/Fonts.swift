//
//  Fonts.swift
//  TestTask
//
//  Created by Andrew Hudik on 5/3/25.
//

import SwiftUI

extension Font {
    static let h1 = Font.custom("Inter", size: 24, relativeTo: .title).weight(.semibold)
    static let h2 = Font.custom("Inter", size: 22, relativeTo: .title2).weight(.medium)
    static let h3 = Font.custom("Inter", size: 20, relativeTo: .title3).weight(.medium)
    static let h4 = Font.custom("Inter", size: 18, relativeTo: .title3).weight(.semibold)
    static let buttonLarge = Font.custom("Inter", size: 16, relativeTo: .body).weight(.medium)
    static let buttonSmal = Font.custom("Inter", size: 14, relativeTo: .body).weight(.bold)
    static let body1 = Font.custom("Inter", size: 15, relativeTo: .body).weight(.regular)
    static let body2 = Font.custom("Inter", size: 14, relativeTo: .body).weight(.regular)
    static let captionSmall = Font.custom("Inter", size: 11, relativeTo: .caption2).weight(.semibold)
}
