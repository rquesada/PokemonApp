//
//  View+Extensions.swift
//  PokemonApp
//
//  Created by Roy Quesada on 7/5/23.
//

import Foundation
import SwiftUI

extension View{
    
    func embededNavigation()-> some View {
        return NavigationView{ self }
    }
}
