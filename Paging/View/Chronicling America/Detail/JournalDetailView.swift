//
//  JournalDetailView.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 09.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

struct JournalDetailView: View {
    
    var journal: JournalItem
    
    var body: some View {
        VStack(alignment: .leading) {
            PopButton {
                Text("< Back")
                    .foregroundColor(.blue)
            }
            Text(journal.title ?? "")
                .font(.largeTitle)
            Text(String(journal.startYear ?? 0) + " - " + String(journal.endYear ?? 0))
            Text("Place of publication: " + (journal.placeOfPublication ?? ""))
            Text("Publisher: " + (journal.publisher ?? ""))
            Spacer()
        }
        .padding(20)
    }
}
