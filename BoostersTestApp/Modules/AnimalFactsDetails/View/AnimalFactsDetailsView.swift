//
//  AnimalFactsView.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import SwiftUI
import ComposableArchitecture

struct AnimalFactsDetailsView: View {
    
    let store: StoreOf<AnimalFactsDetailsFeature>
    
    @Environment(\.presentationMode) var presentationMode
    @State private var currentFactIndex = 0
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Color.brandedPurple
                    .ignoresSafeArea(.all)
                
                VStack {
                    if viewStore.category.content == nil {
                        ContentUnavailableView(
                            Constants.contentUnavailableText,
                            systemImage: "pawprint.fill"
                        )
                        
                    } else {
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: AppConstants.containerCornerRadius)
                                .fill(Color.white)
                            VStack {
                                AnimalTabsView(
                                    content: viewStore.category.content,
                                    currentFactIndex: $currentFactIndex
                                )
                                Spacer()
                                actionButtonsView
                            }
                        }
                        .padding()
                    }
                }
            }
            .onChange(of: self.currentFactIndex, initial: viewStore.currentFactIndex != currentFactIndex) { oldValue, newValue in
                viewStore.send(.didChangedIndex(to: newValue))
            }
            .onChange(of: viewStore.currentFactIndex, initial: viewStore.currentFactIndex != currentFactIndex) { oldValue, newValue in
                self.currentFactIndex = newValue
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: navigationBackButton)
        }
    }
    
    private var actionButtonsView: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                Button {
                    self.store.send(.onPrev)
                } label: {
                    makeActionButtonView(for: .prev)
                }
                .disabled(viewStore.currentFactIndex == 0)
                
                Spacer()
                
                Button {
                    self.store.send(.onNext)
                } label: {
                    makeActionButtonView(for: .next)
                }
                .disabled(viewStore.currentFactIndex >= (viewStore.category.content?.count ?? 0) - 1)
            }
            .padding()
        }
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
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack(spacing: 0) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                    Text("\(viewStore.category.title)")
                        .foregroundStyle(.black)
                }
                .padding(.horizontal, 4)
            }
            .background(.white)
            .foregroundStyle(.black)
            .clipShape(Capsule())
        }
    }
    
    private struct Constants {
        static let contentUnavailableText: String = "There is no information available about this category."
        static let actionButtonSize: CGSize = CGSize(width: 50, height: 50)
    }
    
}
