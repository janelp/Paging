//
//  JournalListView.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 08.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

final class JournalsViewModel: ObservableObject {
    
    @Published private(set) var items: [JournalItem] = [JournalItem]()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    func loadPage()  {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        page += 1
        SearchAPI.search(terms: "michigan", format: "json", page: page) { (journal, error) in
            if let journals = journal?.items {
                self.items += journals
            }
            self.isPageLoading = false
        }
    }
}

extension JournalItem: Identifiable {
}

struct JournalListView: View {
    @EnvironmentObject var viewModel: JournalsViewModel
    
    var body: some View {
            List(self.viewModel.items) { item in
                VStack(alignment: .leading) {
                    JournalRowView(item: item)
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


