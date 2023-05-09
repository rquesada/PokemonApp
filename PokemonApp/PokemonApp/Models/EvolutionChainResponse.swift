//
//  EvolutionChainResponse.swift
//  PokemonApp
//
//  Created by Roy Quesada on 8/5/23.
//

struct EvolutionChainResponse : Decodable {
    let chain:Chain
}

class Chain:Decodable {
    let envolvesTo: [Chain]
    let specie:Specie
    
    private enum CodingKeys: String, CodingKey {
        case envolvesTo = "evolves_to"
        case specie = "species"
    }
}
