//
//  AnimalCategoriesView.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import SwiftUI


struct AnimalCategoriesView: View {
    
    private let animalCategories: [AnimalCategoryModel] = AnimalCategoryModel.mockItems
    
    var body: some View {
        List {
            ForEach(animalCategories, id: \.self) { category in
                AnimalCategoryItemView(category: category)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.brandedPurple)
                    .background {
                        NavigationLink(
                            "",
                            destination: AnimalFactsDetailsView(category: category)
                        )
                        .opacity(0) // fixed list row arrow
                    }
            }
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
