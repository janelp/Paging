//
//  NavigationController.swift
//  Paging
//
//  Created by Evgeniya Bubnova on 08.04.2020.
//  Copyright © 2020 Evgeniya Bubnova. All rights reserved.
//

import SwiftUI

// MARK: - Enums

enum NavTransition {
    case none
    case custom(AnyTransition)
}

enum NavType {
    case push
    case pop
}

struct NavigationController<Content>: View where Content: View {
    
    @ObservedObject private var viewModel: NavigationControllerVM
    
    private let content: Content
    private let transitions: (push: AnyTransition, pop: AnyTransition)
    
    init(transition: NavTransition,
         easing: Animation = .easeOut(duration: 0.33),
         @ViewBuilder content: @escaping () -> Content)
    {
        self.viewModel = NavigationControllerVM(easing: easing)
        self.content = content()
        switch transition {
        case .custom(let trans):
            self.transitions = (trans, trans)
        case .none:
            self.transitions = (.identity, .identity)
        }
    }
    
    var body: some View {
        print("reload navigation")
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                content
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop )
                    .environmentObject(viewModel)
            } else {
                viewModel.currentScreen!.nextScreen
                    .transition(viewModel.navigationType == .push ? transitions.push : transitions.pop )
                    .environmentObject(viewModel)
            }
        }
    }
    
}
