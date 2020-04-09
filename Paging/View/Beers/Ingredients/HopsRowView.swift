//
//  HopsRowView.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 08.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

struct HopsRowView: View {
    let igredient: HopsIngredient
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(igredient.name ?? "")
            .bold()
            HStack {
                Text(String(igredient.amount?.value ?? 0))
                Text(igredient.amount?.unit ?? "")
            }
            Text("Add: " + (igredient.add ?? ""))
            Text("Attribute: " + (igredient.attribute ?? ""))
        }
    }
}
