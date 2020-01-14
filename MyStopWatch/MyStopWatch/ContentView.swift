//
//  ContentView.swift
//  StopWatch
//
//  Created by Katsuya Terahata on 2020/01/09.
//  Copyright © 2020 Katsuya Terahata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
                TabView{
                    WatchView()
                        .tabItem{
                            Image(systemName: "stopwatch.fill")
                            Text("StopWatch")
                            }
                    AlarmView()
                        .tabItem{
                            Image(systemName: "alarm.fill")
                            Text("Alarm")
                            }
                        }.accentColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
