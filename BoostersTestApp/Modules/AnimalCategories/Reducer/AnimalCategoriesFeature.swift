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
    
    private let apiClient = APIClient()
    
    struct State: Equatable {
        var isLoading = true
        var animalCategories: [AnimalCategoryModel] = []
        
        var selectedCategory: AnimalCategoryModel?
        @PresentationState var alert: AlertState<Action.Alert>?
        @PresentationState var selection: AnimalFactsDetailsFeature.State?
    }
    
    enum Action {
        case fetchAnimalCategories
        case didReceiveAnimalCategories([AnimalCategoryModel])
        
        case didSelectCategory(AnimalCategoryModel)
        
        case selection(PresentationAction<AnimalFactsDetailsFeature.Action>)
        case alert(PresentationAction<Alert>)
        
        case alertAdFinished
        
        enum Alert {
            case showAd
            case comingSoon
        }
    }
    
    var body: some ReducerOf<AnimalCategoriesFeature> {
        Reduce { state, action in
            switch action {
            case .fetchAnimalCategories:
                guard state.animalCategories.isEmpty else { return .none }
                
                state.isLoading = true
                return .run { send in
                    let categories = try await apiClient.fetchAnimalCategories()
                    await send(.didReceiveAnimalCategories(categories))
                }
                
            case let .didReceiveAnimalCategories(response):
                state.animalCategories = response.sorted(by: { $0.order < $1.order })
                state.isLoading = false
                return .none
                
            case .alert(.presented(.showAd)):
                state.isLoading = true
                return .run { send in
                    try await Task.sleep(for: .seconds(Constants.paidAlertDurationSleep))
                    await send(.alertAdFinished)
                }
                
            case .alert:
                return .none
                
            case let .didSelectCategory(category):
                state.selectedCategory = category
                
                switch category.status {
                case .free:
                    state.alert = nil
                    state.selection = AnimalFactsDetailsFeature.State(category: category)
                case .paid:
                    state.alert = AlertState {
                        TextState("Watch Ad to continue")
                    } actions: {
                        ButtonState(role: .cancel) {
                            TextState("Cancel")
                        }
                        ButtonState(action: .showAd) {
                            TextState("Show Ad")
                        }
                    }
                case .comingSoon:
                    state.selection = nil
                    state.alert = AlertState {
                        TextState("Coming Soon")
                    } actions: {
                        ButtonState(role: .cancel) {
                            TextState("Ok")
                        }
                    }
                }
                return .none
                
            case .alertAdFinished:
                state.alert = nil
                state.isLoading = false
                if let category = state.selectedCategory {
                    state.selection = AnimalFactsDetailsFeature.State(category: category)
                }
                return .none
                
            case .selection(_):
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
        .ifLet(\.$selection, action: /Action.selection) {
            AnimalFactsDetailsFeature()
        }
    }
    
    private struct Constants {
        static let paidAlertDurationSleep: CGFloat = 2
    }
    
}
