//
//  LoaderOverViewModifier.swift
//  TestTask
//
//  Created by Andrew Hudik on 8/3/25.
//


import SwiftUI

/// A modifier that displays loader above the view when the view is in the loading state.
struct LoaderOverViewModifier {

    /// Determines if is in loading state.
    let isLoading: Bool
}

extension LoaderOverViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
            if isLoading {
                ProgressView()
            }
        }
    }
}

extension View {
    func withLoaderOverView(isLoading: Bool) -> some View {
        modifier(
            LoaderOverViewModifier(isLoading: isLoading)
        )
    }
}
