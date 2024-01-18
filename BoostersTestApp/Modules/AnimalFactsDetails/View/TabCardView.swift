//
//  TabCardView.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import SwiftUI

struct TabCardView: View {
    
    let animalFact: AnimalFact
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                AsyncImage(url: animalFact.image) { image in
                    image
                        .resizable()
                        .frame(height: Constants.imageSize)
                        .mask {
                            RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius / 2)
                        }
                        .clipped()
                } placeholder: {
                    RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius / 2)
                        .foregroundColor(.gray)
                        .frame(height: Constants.imageSize)
                }
                
                Text(animalFact.fact)
                    .lineLimit(nil)
                    .foregroundStyle(.black)
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }
    
    private struct Constants {
        static let imageSize: CGFloat = 250
    }
}
