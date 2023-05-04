//
//  SwiftUIView.swift
//  
//
//  Created by Oleksandr on 21.04.2023.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        //Main content
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .bottomDrawerView( // EdgesBottomDrawer
            bottomDrawerHeight: 80, /* Drawer height when closed*/
            drawerTopCornersRadius: 16 /*Top corners radius*/,
            ignoreTopSafeAres: false /* Ignore safe areas? */) {
                // Drawer content
                ZStack {
                    Color.black
                    Text("Hello Drawer")
                        .font(.system(size: 24))
                        .foregroundColor(Color.white)
                }
            } pullUpView: { shouldGoUp in
                // Drawer pull up view
                ZStack {
                    Color.black
                    if shouldGoUp {
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.white)
                    } else {
                        Image(systemName: "chevron.up")
                            .foregroundColor(Color.white)
                    }
                }
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
