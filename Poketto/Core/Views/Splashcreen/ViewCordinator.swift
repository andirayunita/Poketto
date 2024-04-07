//
//  ViewCordinator.swift
//  Poketto
//
//  Created by Andira Yunita on 05/04/24.
//

import SwiftUI

struct ViewCordinator: View {
    @State private var isActive = false
    var body: some View {
        Group {
            if isActive {
                PokettoTabView()
            } else {
                Splashscreen(isActive: $isActive)
            }
        }
    }
}

#Preview {
    ViewCordinator()
}
