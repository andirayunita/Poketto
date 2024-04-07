//
//  PokemonDetail.swift
//  Poketto
//
//  Created by Andira Yunita on 06/04/24.
//

import Foundation

struct PokemonDetail: Codable {
    var name: String
    var sprites: PokemonSprites
    var moves: [PokemonMoves]
    var types: [PokemonTypes]
    var species: PokemonSpecies
}

struct PokemonSprites: Codable {
    var frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonMoves: Codable {
    var move: PokemonSpecies
}

struct PokemonTypes: Codable {
    var types: PokemonSpecies
}

struct PokemonSpecies: Codable {
    var name: String
    var url: String
}
