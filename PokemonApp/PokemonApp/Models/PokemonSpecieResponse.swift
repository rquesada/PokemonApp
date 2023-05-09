//
//  PokemonSpecieResponse.swift
//  PokemonApp
//
//  Created by Roy Quesada on 8/5/23.
//

struct PokemonSpecieResponse : Decodable
{
    let isLegendary:Bool
    let isMythical:Bool
    let evolutionChainUrl:EvolutionChainDetail
    
    private enum CodingKeys: String, CodingKey {
        case isLegendary = "is_legendary"
        case isMythical = "is_mythical"
        case evolutionChainUrl = "evolution_chain"
    }
}

struct EvolutionChainDetail : Decodable
{
    let url: String
}

