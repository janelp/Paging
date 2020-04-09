//
//  PopButton.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 08.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

struct PopButton<Label>: View where Label: View {
    
    @EnvironmentObject private var viewModel: NavigationControllerVM
    
    private let label: Label
    
    init(@ViewBuilder label: @escaping () -> Label) {
        self.label = label()
    }
    
    var body: some View {
        label.onTapGesture {
            self.pop()
        }
    }
    
    private func pop() {
        viewModel.pop()
    }
    
}
