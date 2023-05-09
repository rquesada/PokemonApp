//
//  SpecieResponse.swift
//  PokemonApp
//
//  Created by Roy Quesada on 6/5/23.
//

struct SpecieResponse : Decodable
{
    let species:[Specie]
    
    private enum CodingKeys: String, CodingKey {
        case species = "results"
    }
}
