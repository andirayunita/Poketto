//
//  AsyncImageView.swift
//  Poketto
//
//  Created by Andira Yunita on 07/04/24.
//

import SwiftUI

struct AsyncImageView: View {
    var pokemon: Pokemon
    var body: some View {
        if let urlString = pokemon.pokemonDetails?.sprites.other?.officialArtwork.frontDefault,
           let url = URL(string: urlString) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView("Loading...")
            }
        } else {
            Image(systemName: "questionmark.diamond")
                .imageScale(.large)
                .foregroundStyle(.white)
        }
    }
}
