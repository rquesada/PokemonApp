//
//  SpecieListViewModel.swift
//  PokemonApp
//
//  Created by Roy Quesada on 6/5/23.
//

import Foundation

class SpecieListViewModel: ObservableObject
{
    let httpClient = HTTPClient()
    @Published var species = [SpecieViewModel]()
    @Published var specieListFull = false
    
    func getNextSpecies()
    {
        httpClient.getSpecies(){ result in
            switch result{
            case .success(let species):
                if let species = species {
                    DispatchQueue.main.async {
                        self.specieListFull = species.count < pageSize
                        self.species.append(contentsOf: species.map(SpecieViewModel.init))  
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
}
