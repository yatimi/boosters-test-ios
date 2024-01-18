//
//  AnimalCategoryItemView.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import SwiftUI

struct AnimalCategoryItemView: View {
    
    let category: AnimalCategoryModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius)
                .fill(.white)
                .ignoresSafeArea(.all)
                .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
            
            HStack  {
                categoryImage
                descriptionStackView
                Spacer()
            }
            
            .overlay {
                if category.status == .comingSoon {
                    Image(.comingSoon)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(size: Constants.comingSoonImageSize)
                        .rotationEffect(.init(degrees: -15))
                        .frame(alignment: .trailing)
                        .offset(x: UIScreen.main.bounds.width / 3.5)
                    RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius)
                        .fill(.black.opacity(0.40))
                }
            }
        }
        .frame(height: Constants.cardHeight)
    }
    
    private var descriptionStackView: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(category.title)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.black)
            
            Text(category.description)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(.gray)
            
            Spacer()
            
            if category.status == .paid {
                PremiumLockView()
            }
        }
        .padding(.vertical, AppConstants.containerCornerRadius)
    }
    
    private var categoryImage: some View {
        AsyncImage(url: category.image) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(size: Constants.imageSize)
                .clipped()
                .mask {
                    RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius / 2)
                }
        } placeholder: {
            RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius / 2)
                .foregroundColor(.gray)
                .frame(size: Constants.imageSize)
        }
        .padding([.leading, .top, .bottom], Constants.containerVerticalPadding)
    }
    
    private struct Constants {
        static let imageSize: CGSize = CGSize(width: 120, height: 100)
        static let comingSoonImageSize: CGSize = CGSize(width: 100, height: 80)
        static let containerVerticalPadding: CGFloat = 4
        static let cardHeight: CGFloat = imageSize.height
    }
    
}
