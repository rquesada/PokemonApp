//
//  SpecieListScreen.swift
//  PokemonApp
//
//  Created by Roy Quesada on 6/5/23.
//

import SwiftUI

struct SpecieListScreen: View {
    
    @ObservedObject private var specieListVM: SpecieListViewModel
    
    init(){
        specieListVM = SpecieListViewModel()
        specieListVM.getNextSpecies()
    }
    var body: some View {
        VStack {
            List {
                ForEach(specieListVM.species) { specie in
                    NavigationLink(destination: SpecieDetailScreen(specieVM: specie)) {
                        SpecieCellView(specieVM: specie)
                    }
                }
                
                
                if !specieListVM.specieListFull
                {
                    Text("Loading more...")
                        .onAppear(){
                            specieListVM.getNextSpecies()
                        }
                }
                
            }.navigationBarTitle("Pokemons")
        }.embededNavigation()

    }
}

struct SpecieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        SpecieListScreen()
    }
}
