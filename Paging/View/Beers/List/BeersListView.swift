//
//  BeersListView.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 08.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

final class BeersViewModel: ObservableObject {
    
    @Published private(set) var items: [Beer] = [Beer]()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    func loadPage()  {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        page += 1
        BeersAPI.getBeers(page: page) { (beers, error) in
            if let beers = beers {
                self.items += beers
            }
            self.isPageLoading = false
        }
    }
}

extension Beer: Identifiable {
    var imageURL: URL? {
        guard let url = self.imageUrl else { return nil }
        return URL(string: url)
    }
}

struct BeersListView: View {
    @EnvironmentObject var viewModel: BeersViewModel
    
    var body: some View {
            List(self.viewModel.items) { item in
                VStack(alignment: .leading) {
                    BeerRowView(item: item)
                        .onAppear() {
                            if self.viewModel.items.isLast(item) {
                                self.viewModel.loadPage()
                            }
                    }
                }
            }
            .onAppear() {
            self.viewModel.loadPage()
        }
    }
}

struct BeersListView_Previews: PreviewProvider {
    static var previews: some View {
        BeersListView()
    }
}
