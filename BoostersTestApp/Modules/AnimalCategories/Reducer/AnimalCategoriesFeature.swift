//
//  AnimalCategoriesFeature.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AnimalCategoriesFeature {
    
    struct State: Equatable {
        var isLoading = true
        var animalCategories: [AnimalCategoryModel] = []
        var path = StackState<AnimalFactsDetailsFeature.State>()
    }
    
    enum Action {
        case fetchAnimalCategories
        case didReceiveAnimalCategories([AnimalCategoryModel])
        case path(StackAction<AnimalFactsDetailsFeature.State, AnimalFactsDetailsFeature.Action>)
    }
    
    var body: some ReducerOf<AnimalCategoriesFeature> {
        Reduce { state, action in
            switch action {
            case .fetchAnimalCategories:
                state.isLoading = true
                return .run { send in
                    guard let url = URL(string: AppConstants.jsonURLString) else { return }
                    let (data, _) = try await URLSession.shared.data(from: url)
                    let categories = try JSONDecoder().decode([AnimalCategoryModel].self, from: data)
                    await send(.didReceiveAnimalCategories(categories))
                }
                
            case let .didReceiveAnimalCategories(response):
                state.animalCategories = response.sorted(by: { $0.order < $1.order })
                state.isLoading = false
                return .none
                
            case .path:
                return .none
            }
        }.forEach(\.path, action: /Action.path) {
            AnimalFactsDetailsFeature()
        }
    }
    
}

