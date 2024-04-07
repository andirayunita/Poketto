//
//  Pokemon.swift
//  Poketto
//
//  Created by Andira Yunita on 05/04/24.
//

import Foundation

struct AllPokemonResponse: Codable {
    var results: [Pokemon]
}

struct Pokemon: Codable, Identifiable {
    var id = UUID()
    var name: String
    var url: String
    var pokemonDetails: PokemonDetails?
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
