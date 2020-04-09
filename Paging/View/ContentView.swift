//
//  ContentView.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 25.03.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var beersViewModel: BeersViewModel
    @EnvironmentObject var journalsViewModel: JournalsViewModel
    
    @State private var selectorIndex = 0
    @State private var numbers = ["Beer","Chronicling America"]
    
    var body: some View {
        NavigationController(transition: .custom(.opacity)) {
            VStack {
                Picker("Numbers", selection: self.$selectorIndex) {
                    ForEach(0 ..< self.numbers.count) { index in
                        Text(self.numbers[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                if self.selectorIndex == 0 {
                    BeersListView()
                }
                else {
                    JournalListView()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
