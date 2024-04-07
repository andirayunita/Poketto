//
//  PokemonCell.swift
//  Poketto
//
//  Created by Andira Yunita on 05/04/24.
//

import SwiftUI

struct PokemonCell: View {
    var pokemon: Pokemon
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 175, height: 180)
                .foregroundStyle(ColorUtility.randomColor())
            
            VStack {
                AsyncImageView(pokemon: pokemon)
                    .frame(width: 120, height: 120)
                
                Text(pokemon.name.capitalized)
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
        }
    }
}

//#Preview {
//    PokemonCell()
//}
