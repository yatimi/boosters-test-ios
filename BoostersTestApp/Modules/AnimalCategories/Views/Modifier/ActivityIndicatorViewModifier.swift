//
//  ActivityIndicatorViewModifier.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 23.01.2024.
//

import SwiftUI

/// Loading indicator display modifier
///
/// Makes the content disabled to fire in loading state
struct ActivityIndicatorViewModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .opacity(isLoading ? 0.5 : 1)
                .disabled(isLoading)
            
            ActivityIndicatorView(isPresented: .constant(isLoading))
        }
        .animation(.default, value: isLoading)
    }
}

extension View {
    func loadingOverlay(if isLoading: Bool) -> some View {
        modifier(ActivityIndicatorViewModifier(isLoading: isLoading))
    }
}
