//
//  AnimalFactsDetailsFeature.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AnimalFactsDetailsFeature {
    
    struct State: Equatable {
        var category: AnimalCategoryModel
        var currentFactIndex = 0
    }
    
    enum Action {
        case onPrev, onNext
        case didChangedIndex(to: Int)
    }
    
    var body: some ReducerOf<AnimalFactsDetailsFeature> {
        Reduce { state, action in
            switch action {
            case .onPrev:
                if state.currentFactIndex != 0 {
                    state.currentFactIndex -= 1
                }
                return .none
                
            case .onNext:
                let factsCount: Int = state.category.content?.count ?? 0 - 1
                if state.currentFactIndex < factsCount {
                    state.currentFactIndex += 1
                }
                return .none
                
            case let .didChangedIndex(to: newIndex):
                state.currentFactIndex = newIndex
                return .none
            }
        }
    }
    
}
