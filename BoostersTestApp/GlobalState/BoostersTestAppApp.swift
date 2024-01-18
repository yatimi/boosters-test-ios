//
//  BoostersTestAppApp.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct BoostersTestAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AnimalCategoriesView(store: Store(initialState: AnimalCategoriesFeature.State()) {
                    AnimalCategoriesFeature()
                        ._printChanges()
                })
            }
        }
    }
    
}
