//
//  MyPokemon.swift
//  Poketto
//
//  Created by Andira Yunita on 05/04/24.
//

import SwiftUI

struct MyPokemon: View {
    @StateObject private var pokemonVM = PokemonViewModel()
    @State private var showAlertRelease = false
    @State private var deletePokemon: Pokemon?
    let mathHelper = MathHelper()
    
    var filteredPokemon: [Pokemon] {
        return pokemonVM.catchedPokemon
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredPokemon) { poke in
                    NavigationLink(destination: EmptyView()) {
                        HStack(spacing: 15) {
                            Image(.imgIvysaur)
                                .resizable()
                                .frame(width: 80, height: 80)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Name:")
                                    .fontWeight(.semibold)
                                    .font(.system(.headline, design: .rounded))
                                Text(poke.name)
                                    .fontWeight(.bold)
                                    .font(.system(.caption, design: .rounded))
                                
                                
                                Text("Nickname:")
                                    .fontWeight(.semibold)
                                    .font(.system(.headline, design: .rounded))
                                Text("Mighty Pikachu")
                                    .fontWeight(.bold)
                                    .font(.system(.caption, design: .rounded))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background {
                                        RoundedRectangle(cornerRadius: 30)
                                            .foregroundStyle(ColorUtility.randomColor())
                                    }
                            }
                            
                            Button {
                                print("Edit name button tapped")
                            } label: {
                                Image(systemName: "pencil.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(.green)
                            }
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                                print("Trash button tapped")
//                                deletePokemon = pokemon
                                showAlertRelease = true
                            } label: {
                                Image(systemName: "trash.circle.fill")
                            }
                            .tint(.red)
                        }
                    }
                }
            }
            .navigationTitle("My Pokemon")
        }
        .confirmationDialog("Are you sure you want to release this Pokemon?", isPresented: $showAlertRelease, titleVisibility: .visible) {
            Button("Delete", role: .destructive) {
                if mathHelper.isPrimeNumber() {
                    if let deletePokemon = deletePokemon {
                        pokemonVM.releasePokemon(pokemon: deletePokemon)
                        print("yes release")
                    }
                } else {
                    print("No")
                }
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This operation cannot be undone.")
        }
    }
}

#Preview {
    MyPokemon()
}
