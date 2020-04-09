//
//  JournalRowView.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 08.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

struct JournalRowView: View {
    @EnvironmentObject var viewModel: JournalsViewModel
    
    let item: JournalItem
    
    var body: some View {
        PushButton(destination: JournalDetailView(journal: item)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(self.item.title ?? "")
                        .font(.headline)
                    
                    if self.viewModel.isPageLoading && self.viewModel.items.isLast(self.item) {
                        Divider()
                        Text("Loading...")
                    }
                }
            }
        }
    }
}

