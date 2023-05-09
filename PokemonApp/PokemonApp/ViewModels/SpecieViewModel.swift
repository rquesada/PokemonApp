//
//  SpecieViewModel.swift
//  PokemonApp
//
//  Created by Roy Quesada on 6/5/23.
//
import Foundation

class SpecieViewModel: Identifiable, ObservableObject{
    let id = UUID()
    let specie: Specie
    let httpClient = HTTPClient()
    var chainId:String?
    
    var name:String{
        specie.name
    }
    
    var url: String{
        specie.url
    }
    
    var specieId:String{
        if let lastN = index{
            return String("\(lastN)")
        }
        return "0"
    }
    
    var index:Int?{
        let iden = getLast(url)
        return Int(iden)
    }
    
    init(specie: Specie) {
        self.specie = specie
    }
    
    //Used to get index used in url
    func getLast(_ link: String) -> String{
        let chunkUrl = link.split(separator: "/")
        if let last = chunkUrl.last{
            return String(last)
        }
        return "0"
    }
    
    func getPokemonSpecie(completion: @escaping () -> Void)
    {
        guard let index = index else { return }
        httpClient.getPokemonSpecie(String(index)){ result in
            switch result{
            case .success(let pokemonSpecie):
                if let pokemonSpecie = pokemonSpecie {
                    let evolutionChainUrl = pokemonSpecie.evolutionChainUrl.url
                    self.chainId = self.getLast(evolutionChainUrl)
                    completion()
                }
            case .failure(let error):
                //ToDo: Add error handler
                print(error.localizedDescription)
                completion()
            }
        }
    }
}
