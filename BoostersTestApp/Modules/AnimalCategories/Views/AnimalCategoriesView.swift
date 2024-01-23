//
//  AnimalCategoriesView.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import SwiftUI
import ComposableArchitecture

struct AnimalCategoriesView: View {
    typealias ViewStoreType = ViewStore<AnimalCategoriesFeature.State, AnimalCategoriesFeature.Action>
    
    let store: StoreOf<AnimalCategoriesFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                if viewStore.animalCategories.isEmpty && !viewStore.isLoading {
                    contentUnavailableView()
                } else {
                    categoriesList(with: viewStore)
                }
            }
            .loadingOverlay(
                if: viewStore.isLoading
            )
            .task {
                viewStore.send(.fetchAnimalCategories)
            }
            .refreshable {
                viewStore.send(.fetchAnimalCategories)
            }
        }
        .alert(
            store: self.store.scope(state: \.$alert, action: \.alert)
        )
        .navigationDestination(
            store: self.store.scope(
                state: \.$selection,
                action: AnimalCategoriesFeature.Action.selection
            ),
            destination: { store in
                AnimalFactsDetailsView(store: store)
            }
        )
    }
    
    private func contentUnavailableView() -> some View {
        ContentUnavailableView {
            Text(Constants.contentUnavailableText)
        }
    }
    
    private func categoriesList(with viewStore: ViewStoreType) -> some View {
        List {
            ForEach(viewStore.animalCategories, id: \.self) { category in
                AnimalCategoryItemView(category: category)
                    .onTapGesture {
                        store.send(.didSelectCategory(category))
                    }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.brandedPurple)
        }
        .listStyle(.plain)
        .navigationTitle(Constants.title)
        .background(.brandedPurple)
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
