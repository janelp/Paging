//
//  MaltRowView.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 08.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

struct MaltRowView: View {
    
    let igredient: MaltIngredient
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(igredient.name ?? "")
                .bold()
            HStack {
                Text(String(igredient.amount?.value ?? 0))
                Text(igredient.amount?.unit ?? "")
            }
        }
    }
}
