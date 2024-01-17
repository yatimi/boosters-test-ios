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
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                        .mask {
                            RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius / 2)
                        }
                } placeholder: {
                    RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius / 2)
                        .foregroundColor(.gray)
                        .frame(height: 300)
                }
                
                Text(animalFact.fact)
                    .lineLimit(nil)
                    .foregroundStyle(.black)
            }
            .padding([.leading, .trailing])
        }
        .clipShape(RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius))
    }
}
