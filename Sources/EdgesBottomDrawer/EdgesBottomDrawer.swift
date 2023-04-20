//
//  BottomDrawerView.swift
//
//
//  Created by AlexMochalov on 20.04.2023.
//

import SwiftUI

struct BottomDrawerView<Content: View, DrawerContent: View, PullUpView: View>: View {
    var content: () -> Content
    var drawerContent: () -> DrawerContent
    var pullUpView: (_ shouldGoUp: Bool) -> PullUpView
    var bottomDrawerHeight: CGFloat = 100
    var drawerTopCornerRadius: CGFloat = 32
    
    @State var lastOffset: CGFloat = 0
    @State var offset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    
    init(
        bottomDrawerHeight: CGFloat = 100,
        drawerTopCornerRadius: CGFloat = 32,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder drawerContent: @escaping () -> DrawerContent,
        @ViewBuilder pullUpView: @escaping (_ shouldGoUp: Bool) -> PullUpView
    ) {
        self.content = content
        self.drawerContent = drawerContent
        self.pullUpView = pullUpView
        self.bottomDrawerHeight = bottomDrawerHeight
    }
    
    var body: some View {
        ZStack {
            content()
                .blur(radius: getBlurRadius())
                .ignoresSafeArea()
            GeometryReader { proxy -> AnyView in
                let height = proxy.frame(in: .global).height
                return AnyView(
                    ZStack {
                        Color.white
                            .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: self.drawerTopCornerRadius))
                        VStack(spacing: 0) {
                            self.pullUpView(-offset > (height - self.bottomDrawerHeight * 2))
                                .frame(height: self.bottomDrawerHeight)
                            drawerContent()
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                    }
                    .offset(y: height - self.bottomDrawerHeight)
                    .offset(y: -offset > 0 ? -offset <= (height - self.bottomDrawerHeight) ? offset: -(height - self.bottomDrawerHeight) : 0)
                    .gesture(
                        DragGesture()
                            .updating(self.$gestureOffset, body: { value, out, _ in
                                out = value.translation.height
                                onChangeDragGesture()
                            })
                            .onEnded({ value in
                                let maxHeight = height - self.bottomDrawerHeight
                                withAnimation {
                                    if -offset > maxHeight / 2 {
                                        offset = -maxHeight
                                    } else {
                                        offset = 0
                                    }
                                }
                                self.lastOffset = offset
                            })
                    )
                )
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
    
    func onChangeDragGesture() {
        DispatchQueue.main.async {
            self.offset = gestureOffset + lastOffset
        }
    }
    
    func getBlurRadius() -> CGFloat {
        let progress = -offset / (UIScreen.main.bounds.height - 100)
        return progress * 20
    }
}
