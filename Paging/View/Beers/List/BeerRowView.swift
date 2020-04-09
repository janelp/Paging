//
//  BeerRowView.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 08.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

struct BeerRowView: View {
    
    @EnvironmentObject var viewModel: BeersViewModel
    
    let item: Beer
    
    var body: some View {
        PushButton(destination: BeerDetailView(beer: item)) {
            HStack {
                ZStack {
                    AsyncImage(
                        url: self.item.imageURL,
                        placeholder: Image(systemName: "slowmo")
                    )
                        .aspectRatio(contentMode: .fit)
                }
                .frame(minWidth: 0, maxWidth: 50)
                VStack(alignment: .leading) {
                    Text(self.item.name ?? "")
                        .font(.headline)
                    Text(self.item.description ?? "")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    if self.viewModel.isPageLoading && self.viewModel.items.isLast(self.item) {
                        Divider()
                        Text("Loading...")
                    }
                }
            }
        }
    }
}

struct BeerRowView_Previews: PreviewProvider {
    static var previews: some View {
        BeerRowView(item: Beer(id: 0, name: "123", description: nil, firstBrewed: nil, imageUrl: nil, ingredients: nil))
    }
}
