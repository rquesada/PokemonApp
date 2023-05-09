//
//  HTTPClient.swift
//  PokemonApp
//
//  Created by Roy Quesada on 6/5/23.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

let pageSize = 20
let apiURL = "https://pokeapi.co/api/v2"
let imageBaseUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon" 

class HTTPClient {
    
    var offset = 0
    func getSpecies(completion: @escaping (Result<[Specie]?, NetworkError>)-> Void)
    {
        guard let url = URL.forSpecies(String(offset)) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let specieResponse = try? JSONDecoder().decode(SpecieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            self.offset += pageSize
            completion(.success(specieResponse.species))
            
        }.resume()
    }
    
    func getPokemonSpecie(_ index:String, completion: @escaping (Result<PokemonSpecieResponse?, NetworkError>)-> Void){
        
        guard let url = URL.forPokemonSpecie(index) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let pokemonSpecieResponse = try? JSONDecoder().decode(PokemonSpecieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(pokemonSpecieResponse))
            
        }.resume()
    }
    
    func getEvolutionChain(_ chainId:String, completion: @escaping (Result<EvolutionChainResponse?, NetworkError>)-> Void){
        guard let url = URL.forEvolutionChain(chainId) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let evolutionChainResponse = try? JSONDecoder().decode(EvolutionChainResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            completion(.success(evolutionChainResponse))
        }.resume()
        
    }
    
    
}
