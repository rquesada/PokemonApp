//
//  SpecieCellView.swift
//  PokemonApp
//
//  Created by Roy Quesada on 7/5/23.
//

import SwiftUI

struct SpecieCellView: View {
    let specieVM:SpecieViewModel
    var body: some View {
        HStack{
            AsyncImage(url: URL.forImage(specieVM.specieId))
            Text(specieVM.name.capitalized)
                .fontWeight(.light)
                .font(.system(size: 24))
        }
    }
}
