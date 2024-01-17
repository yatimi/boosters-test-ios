//
//  AnimalCategoryModel.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import Foundation

struct AnimalCategoryModel: Codable, Hashable {
    let title: String
    let description: String
    let image: URL
    let order: Int
    let status: AnimalCategoryStatus
    let content: [AnimalFact]?
}

extension AnimalCategoryModel: Equatable {
    static func == (lhs: AnimalCategoryModel, rhs: AnimalCategoryModel) -> Bool {
        lhs.title == rhs.title
    }
}

extension AnimalCategoryModel {
    
    static var mockItems: [Self] {
        return [
            AnimalCategoryModel(
                title: "Dogs",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi",
                image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/WelshCorgi.jpeg")!,
                order: 1,
                status: .free,
                content: [
                    AnimalFact(image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/WelshCorgi.jpeg")!, fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi"),
                    AnimalFact(image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/WelshCorgi.jpeg")!, fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi"),
                    AnimalFact(image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/WelshCorgi.jpeg")!, fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi")
                ]
            ),
            AnimalCategoryModel(
                title: "Dragons",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi",
                image: URL(string: "https://static.wikia.nocookie.net/monster/images/6/6e/DragonRed.jpg")!,
                order: 2,
                status: .paid,
                content: [
                    AnimalFact(image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/WelshCorgi.jpeg")!, fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi"),
                    AnimalFact(image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/WelshCorgi.jpeg")!, fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi"),
                    AnimalFact(image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/WelshCorgi.jpeg")!, fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi")
                ]
            ),
            AnimalCategoryModel(
                title: "Pandas",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi",
                image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/8d/Lightmatter_panda.jpg")!,
                order: 3,
                status: .comingSoon,
                content: [
                    AnimalFact(image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/WelshCorgi.jpeg")!, fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi"),
                    AnimalFact(image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/WelshCorgi.jpeg")!, fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi"),
                    AnimalFact(image: URL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/WelshCorgi.jpeg")!, fact: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi")
                ]
            )
        ]
    }
    
}
