//
//  AnimalCategoryModel.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import Foundation

struct AnimalCategoryModel: Hashable {
    let title: String
    let description: String
    let image: URL
    let order: Int
    let status: AnimalCategoryStatus
    let content: [AnimalFact]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.image = try container.decode(URL.self, forKey: .image)
        self.order = try container.decode(Int.self, forKey: .order)
        
        if let content = try? container.decode([AnimalFact].self, forKey: .content) {
            self.content = content
            self.status = try container.decode(AnimalCategoryStatus.self, forKey: .status)
        } else {
            self.content = nil
            self.status = .comingSoon
        }
    }
}

extension AnimalCategoryModel: Codable {
    enum CodingKeys: String, CodingKey {
        case title, description, image, order, status, content
    }
}
