//
//  BottomDrawerModifier.swift
//
//
//  Created by AlexMochalov on 20.04.2023.
//

import SwiftUI

struct BottomDrawerModifier<DrawerContent: View, PullUpView: View>: ViewModifier {
    var bottomDrawerHeight: CGFloat = 100
    var drawerContent: () -> DrawerContent
    var pullUpView: (_ shouldGoUp: Bool) -> PullUpView
    
    func body(content: Content) -> some View {
        BottomDrawerView(
            bottomDrawerHeight: self.bottomDrawerHeight, content: { content }, drawerContent: drawerContent, pullUpView: pullUpView
        )
    }
}
