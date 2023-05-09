//
//  SpecieChainView.swift
//  PokemonApp
//
//  Created by Roy Quesada on 9/5/23.
//

import SwiftUI

struct SpecieChainView: View {
    let specieVM:SpecieViewModel
    let isLast: Bool
    var body: some View {
        VStack{
            AsyncImage(url: URL.forImage(specieVM.specieId))
            Text(specieVM.name).fontWeight(.ultraLight)
            if !isLast {
                Image(systemName: "arrow.down")//.frame(width: 5, height: 5)
            }
        }
    }
}
