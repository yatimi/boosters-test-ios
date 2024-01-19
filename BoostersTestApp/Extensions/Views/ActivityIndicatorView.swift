//
//  ActivityIndicatorView.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 19.01.2024.
//

import SwiftUI

struct ActivityIndicatorView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        if isPresented {
            ZStack{
                RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius / 2)
                    .fill(Color.black.opacity(0.75))
                VStack(spacing: 10) {
                    ProgressView()
                        .tint(.white)
                    Text(Constants.loadingText)
                        .font(.title2)
                        .foregroundStyle(.white)
                }
            }
            .frame(width: 120, height: 120, alignment: .center)
            .background(RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius)
            .stroke(Color.black,lineWidth: 2))
        }
    }
    
    private struct Constants {
        #warning("Localize")
        static let loadingText: String = "Loading..."
    }
}
