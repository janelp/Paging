//
//  IngredientsView.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 08.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

struct IngredientsView: View {
    
    var beer: Beer
    
    var body: some View {
        VStack(alignment: .leading) {
            PopButton {
                Text("< Back")
                    .foregroundColor(.blue)
            }
            Text(beer.name ?? "")
                .font(.largeTitle)
            Text("Inredients:")
                .font(.title)
            IngredientsListView(beer: beer)
        }
        .padding(20)
    }
}
