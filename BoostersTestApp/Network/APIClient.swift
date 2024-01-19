//
//  APIClient.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 19.01.2024.
//

import Foundation

final class APIClient {
    
    func fetchAnimalCategories() async throws -> [AnimalCategoryModel] {
        guard let url = URL(string: AppConstants.jsonURLString) else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([AnimalCategoryModel].self, from: data)
    }
    
}
