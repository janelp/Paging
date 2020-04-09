//
//  BeerDetailView.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 08.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

struct BeerDetailView: View {
    
    var beer: Beer
    
    var body: some View {
        VStack(alignment: .leading) {
            PopButton {
                Text("< Back")
                    .foregroundColor(.blue)
            }
            .padding(20)
            Text(beer.name ?? "")
                .font(.largeTitle)
                .padding(20)
            HStack(alignment: .top) {
                ZStack {
                    AsyncImage(
                        url: beer.imageURL,
                        placeholder: Image(systemName: "slowmo")
                    )
                        .aspectRatio(contentMode: .fit)
                }
                .frame(maxHeight: 200)
                VStack(alignment: .leading) {
                    Text(beer.firstBrewed ?? "")
                        .font(.callout)
                    Text(beer.description ?? "")
                }
            }
            .padding(20)
            PushButton(destination: IngredientsView(beer: beer)) {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.green)
                    Text("Ingredients")
                }
                .frame(height: 40)
            }
            .padding(20)
            Spacer()
        }
    }
}

struct BeerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailView(beer: Beer(id: 0, name: "123", description: nil, firstBrewed: nil, imageUrl: nil, ingredients: nil))
    }
}
