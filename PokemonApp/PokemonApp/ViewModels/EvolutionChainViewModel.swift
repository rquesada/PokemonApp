//
//  EvolutionChainViewModel.swift
//  PokemonApp
//
//  Created by Roy Quesada on 8/5/23.
//

import Foundation
class EvolutionChainViewModel: ObservableObject
{
    let httpClient = HTTPClient()
    var flatEvolution = [SpecieViewModel]()
    @Published var isEvolutionChainReady = false
    
    func getEvolutions(_ chainId:String){
        
        httpClient.getEvolutionChain(chainId){ result in
            switch result{
            case .success(let evolutionChain):
                if let evolutionChain = evolutionChain {
                    self.flatEvolution.removeAll()
                    self.getFlatChain(evolutionChain.chain)
                    DispatchQueue.main.async {
                        self.isEvolutionChainReady = true
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    //ToDo: Add error handler
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getFlatChain(_ chain: Chain)
    {
        flatEvolution.append(SpecieViewModel(specie:chain.specie))
        if let nextChain = chain.envolvesTo.first
        {
            getFlatChain(nextChain)
        }
    }
}
