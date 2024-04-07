//
//  ColorUtility.swift
//  Poketto
//
//  Created by Andira Yunita on 06/04/24.
//

import Foundation
import SwiftUI

struct ColorUtility {
    static func randomColor() -> Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
