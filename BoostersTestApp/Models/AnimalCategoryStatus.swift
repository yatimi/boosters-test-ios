//
//  AnimalCategoryStatus.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import Foundation

enum AnimalCategoryStatus: String, Codable, Hashable {
    case paid, free
    case comingSoon = "coming_soon"
}
