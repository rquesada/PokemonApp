//
//  SpecieDetailScreen.swift
//  PokemonApp
//
//  Created by Roy Quesada on 6/5/23.
//

import SwiftUI

struct SpecieDetailScreen: View {
    
    @ObservedObject private var specieVM: SpecieViewModel
    @ObservedObject private var evolutionChainVM  = EvolutionChainViewModel()
    
    init(specieVM: SpecieViewModel){
        self.specieVM = specieVM
    }
    
    var body: some View {
        VStack{
            AsyncImage(url: URL.forImage(specieVM.specieId)).padding(.top, 40)
            Text("Evolution Chain").underline()
            if evolutionChainVM.isEvolutionChainReady {
                ForEach(evolutionChainVM.flatEvolution.indices, id: \.self) { index in
                    let isLast = index == evolutionChainVM.flatEvolution.count - 1
                    let specie = evolutionChainVM.flatEvolution[index]
                    SpecieChainView(specieVM: specie, isLast: isLast)
                }
            }
            Spacer()
            
            
        }.embededNavigation().navigationBarTitle(specieVM.name.capitalized)
            .onAppear(){
                self.specieVM.getPokemonSpecie(){
                    if let chainId = self.specieVM.chainId {
                        self.evolutionChainVM.getEvolutions(chainId)
                    }
                }
            }
    }
}
