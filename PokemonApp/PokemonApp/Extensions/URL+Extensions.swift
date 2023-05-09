//
//  URL+Extensions.swift
//  PokemonApp
//
//  Created by Roy Quesada on 6/5/23.
//

import Foundation

extension URL{
    
    static func forSpecies(_ offset: String) -> URL?{
        let url = "\(apiURL)/pokemon-species?offset=\(offset)&limit=\(pageSize)"
        return URL(string: "\(url)")
    }
    
    static func forImage(_ index:String) -> URL?{
        let url = "\(imageBaseUrl)/\(index).png"
        return URL(string: "\(url)")
    }
    
    static func forPokemonSpecie(_ index:String) -> URL?{
        let url = "\(apiURL)/pokemon-species/\(index)/"
        return URL(string: "\(url)")
    }
    
    static func forEvolutionChain(_ index:String) -> URL?{
        let url = "\(apiURL)/evolution-chain/\(index)/"
        return URL(string: "\(url)")
    }
}
