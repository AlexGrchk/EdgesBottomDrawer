//
//  File.swift
//  
//
//  Created by AlexMochalov on 20.04.2023.
//

import SwiftUI

public extension View {
    func bottomDrawerView<DrawerContent: View, PullUpView: View>(
        bottomDrawerHeight: CGFloat = 100,
        drawerTopCornersRadius: CGFloat = 32,
        ignoreTopSafeAres: Bool = false,
        @ViewBuilder drawerContent: @escaping () -> DrawerContent,
        @ViewBuilder pullUpView: @escaping (_ shouldGoUp: Bool) -> PullUpView
    ) -> some View {
        self.modifier(EdgesBottomDrawerModifier(
            bottomDrawerHeight: bottomDrawerHeight,
            drawerTopCornersRadius: drawerTopCornersRadius,
            ignoreTopSafeAreas: ignoreTopSafeAres,
            drawerContent: drawerContent,
            pullUpView: pullUpView
        ))
    }
}
