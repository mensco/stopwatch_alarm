//
//  TabView.swift
//  MyStopWatch
//
//  Created by Katsuya Terahata on 2020/01/09.
//  Copyright © 2020 Katsuya Terahata. All rights reserved.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        TabView {
            Text("First")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            Text("Second")
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Post")
                }

                Text("Third")
                .tabItem {
                    Image(systemName: "person")
                    Text("Menu")
                }
        }.accentColor(.purple)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
