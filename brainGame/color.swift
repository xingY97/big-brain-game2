//
//  Color.swift
//  brainGame
//
//  Created by XIN on 2/27/20.
//  Copyright © 2020 XIN. All rights reserved.
//

import Foundation
import UIKit

enum Color : CaseIterable {
    case red, orange, yellow, green, blue, purple
    
    var textColor: UIColor {
        switch self {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .blue:
            return .blue
        case .purple:
            return .purple

        }
    }
    
    var text: String {
        switch self {
        case .red:
            return "red"
        case .orange:
            return "orange"
        case .yellow:
            return "yellow"
        case .green:
            return "green"
        case .blue:
            return "blue"
        case .purple:
            return "purple"
        }
    }

    init() {
        self = .red
        self.getRandomOption()
    }
    mutating func getRandomOption(){
        let randomInt = Int.random(in: 0 ..< Color.allCases.count)
        self = Color.allCases[randomInt]
    }
}
