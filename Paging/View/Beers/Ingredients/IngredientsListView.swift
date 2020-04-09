//
//  IngredientsListView.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 08.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

extension MaltIngredient: Identifiable {
    public var id: String {
        return UUID().uuidString
    }
}

extension HopsIngredient: Identifiable {
    public var id: String {
        return UUID().uuidString
    }
}

struct IngredientsListView: View {
    
    var beer: Beer
    
    var body: some View {
        List {
            Text("Malt")
                .font(.largeTitle)
            ForEach(beer.ingredients?.malt ?? [MaltIngredient]()) {ingredient in
                MaltRowView(igredient: ingredient)
            }
            Text("Hops")
                .font(.largeTitle)
            ForEach(beer.ingredients?.hops ?? [HopsIngredient]()) {ingredient in
                HopsRowView(igredient: ingredient)
            }
            Text("Yeast")
            .font(.largeTitle)
            Text(beer.ingredients?.yeast ?? "")
        }
    }
}
