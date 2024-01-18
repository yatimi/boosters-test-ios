//
//  AnimalTabsView.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import SwiftUI

struct AnimalTabsView: View {
    
    let content: [AnimalFact]?
    @Binding var currentFactIndex: Int
    
    var body: some View {
        VStack {
            TabView(selection: $currentFactIndex) {
                if let facts = content {
                    ForEach(facts.indices, id: \.self) { index in
                        let animalFact = facts[index]
                        TabCardView(animalFact: animalFact)
                            .tag(index)
                    }
                    .padding(.horizontal, 10)
                }
            }
            .animation(.linear, value: self.currentFactIndex)
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
    
}
