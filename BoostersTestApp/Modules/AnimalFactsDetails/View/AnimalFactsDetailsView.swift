//
//  AnimalFactsView.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import SwiftUI

struct AnimalFactsDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let category: AnimalCategoryModel
    @State private var currentFactIndex = 0
    
    var body: some View {
        ZStack {
            Color.brandedPurple
                .ignoresSafeArea(.all)
            
            VStack {
                if category.content == nil {
                    ContentUnavailableView(
                        Constants.contentUnavailableText,
                        systemImage: "pawprint.fill"
                    )
                } else {
                    ZStack {
                        Color.white
                        VStack {
                            AnimalTabsView(
                                content: category.content, 
                                currentFactIndex: $currentFactIndex
                            )
                            Spacer()
                            actionButtonsView
                        }
                    }
                    .frame(height: 500)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: navigationBackButton)
    }
    
    private var actionButtonsView: some View {
        HStack {
            Button {
                self.currentFactIndex -= 1
            } label: {
                makeActionButtonView(for: .prev)
            }
            .disabled(currentFactIndex == 0)
            
            Spacer()
            
            Button {
                self.currentFactIndex += 1
            } label: {
                makeActionButtonView(for: .next)
            }
            .disabled(currentFactIndex == (category.content?.count ?? 0) - 1)
        }
        .padding()
    }
    
    private func makeActionButtonView(for action: ButtonActionType) -> some View {
        ZStack {
            Circle()
                .stroke(.black, lineWidth: 2)
                .fill(.white)
                .frame(size: Constants.actionButtonSize)
            
            Image(systemName: action.systemImageName)
                .tint(.black)
        }
    }
    
    private var navigationBackButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack(spacing: 0) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16))
                    .foregroundStyle(.black)
                Text("\(category.title)")
                    .foregroundStyle(.black)
            }
            .padding(.horizontal, 4)
        }
        .background(.white)
        .foregroundStyle(.black)
        .clipShape(Capsule())
    }
    
    private struct Constants {
        static let contentUnavailableText: String = "There is no information available about this category."
        static let actionButtonSize: CGSize = CGSize(width: 50, height: 50)
    }
    
}
