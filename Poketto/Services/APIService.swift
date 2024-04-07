//
//  APIService.swift
//  Poketto
//
//  Created by Andira Yunita on 05/04/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    private init() { }
    
    // MARK: - All Pokemon
    func fetchAllPokemons() async throws -> [Pokemon] {
        let urlString = Constants.pokemonsUrl
        guard let url = URL(string: urlString) else {
            print("Error could not convert \(String(describing: urlString)) to a URL")
            throw URLError(.badURL)
        }
        print("We are accessing url \(url)")
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.init(rawValue: httpResponse.statusCode))
        }
        
        let pokemons = try? JSONDecoder().decode(AllPokemonResponse.self, from: data)
        return pokemons?.results ?? []
    }
    
    // MARK: - Pokemon Detail
    func fetchPokemonDetails(urlString: String) async throws -> PokemonDetails? {
        guard let url = URL(string: urlString) else { return nil }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.init(rawValue: httpResponse.statusCode))
        }
        
        let detail = try? JSONDecoder().decode(PokemonDetails.self, from: data)
        return detail
    }
}
