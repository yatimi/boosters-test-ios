//
//  AnimalCategoriesView.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import SwiftUI

struct AnimalCategoriesView: View {
    
    private let animals: [AnimalCategoryModel] = AnimalCategoryModel.mockItems
    
    var body: some View {
        List(animals, id: \.self) { category in
            AnimalCategoryItemView(category: category)
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
    }
}

#Preview {
    AnimalCategoriesView()
}
