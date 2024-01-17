//
//  ButtonActionType.swift
//  BoostersTestApp
//
//  Created by Artem Zabihailo on 17.01.2024.
//

import Foundation

enum ButtonActionType {
    case prev, next
    
    var systemImageName: String {
        switch self {
        case .prev:
            return "arrow.left"
        case .next:
            return "arrow.right"
        }
    }
}
