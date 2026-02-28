//
//  DrowningViewModel.swift
//  Alagamar
//
//  Created by Yasmin Salamon on 27/02/26.
//

import SwiftUI

@MainActor
class DrowningViewModel: ObservableObject {
    
    var mira: ImageResource
    var duda: Bool
    var circle: Bool
    
    init() {
        self.mira = .gameassets3
        self.duda = true
        self.circle = false
    }
}
