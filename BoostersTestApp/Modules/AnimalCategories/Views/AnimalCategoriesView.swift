//
//  AnimalCategoriesView.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import SwiftUI
import ComposableArchitecture

struct AnimalCategoriesView: View {
    
    let store: StoreOf<AnimalCategoriesFeature>
    
    var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: { .detailsPath($0) })) {
            WithViewStore(self.store, observe: { $0 }) { viewStore in
                ZStack {
                    if viewStore.animalCategories.isEmpty && !viewStore.isLoading {
                        ContentUnavailableView { 
                            Text(Constants.contentUnavailableText)
                        }
                    } else {
                        List {
                            ForEach(viewStore.animalCategories, id: \.self) { category in
                                ZStack {
                                    AnimalCategoryItemView(category: category)
                                    NavigationLink(state: AnimalFactsDetailsFeature.State(category: category)) {
                                        EmptyView()
                                    }
                                    .opacity(0) // hide list right arrow
                                }
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.brandedPurple)
                        }
                        .listStyle(.plain)
                        .navigationTitle(Constants.title)
                        .background(.brandedPurple)
                    }
                    
                    if viewStore.isLoading {
                        ProgressView()
                    }
                }
                .task {
                    viewStore.send(.fetchAnimalCategories)
                }
                .refreshable {
                    viewStore.send(.fetchAnimalCategories)
                }
            }
        } destination: { store in
            AnimalFactsDetailsView(store: store)
        }
    }
    
    private struct Constants {
        #warning("Localize")
        static let title: String = "Animal Categories"
        static let contentUnavailableText: String = "The list of categories is empty.\nTry again later"
    }
}

#Preview {
    NavigationStack {
        AnimalCategoriesView(
            store: Store(initialState: AnimalCategoriesFeature.State()) {
                AnimalCategoriesFeature()
            }
        )
    }
}
