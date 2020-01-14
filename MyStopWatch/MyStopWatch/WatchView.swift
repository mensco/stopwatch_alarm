//
//  WatchView.swift
//  MyStopWatch
//
//  Created by Katsuya Terahata on 2020/01/09.
//  Copyright © 2020 Katsuya Terahata. All rights reserved.
//

import SwiftUI

struct WatchView: View {
    
    @ObservedObject var stopwatch = StopWatch() // make an instance
    // activation flag for timer
    // True: Timer is activated
    // Flase: Timer is not activated
    @State var isPlaying = false
    @State var ButtonLabel: String = "Start"
    @State var ResetLabel: String = "Reset"
    
    @State var rcolor: Double = 0
    @State var gcolor: Double = 0.5
    @State var bcolor: Double = 0.2
    @State var StartStopColor =  Color.green
    @State var lapList: [String] = []
    
    func switchStopColor(){
        self.rcolor = 0.4
        self.gcolor = 0
        self.bcolor = 0
    }
    func switchStartColor(){
        self.rcolor = 0
        self.gcolor = 0.5
        self.bcolor = 0.2
    }
    
    func zero_padding(value: Int) -> String{
        return String(format: "%02d" , value)
    }
    
    func stopWatchLap(milsecCounter: Int, secCounter: Int, minCounter: Int) -> [String] {
        let lap: String  = "\(zero_padding(value: milsecCounter))" + "\(zero_padding(value: secCounter))" + "\(zero_padding(value: minCounter))"
        print(lap)
        lapList.append(lap)
        return lapList
    }
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.top)
        GeometryReader{ geometry in
        VStack{
            HStack{
                Text(self.zero_padding(value: Int(self.stopwatch.minCounter)))
                    .fontWeight(.heavy)
                    .padding(15)
                Text(":")
                Text(self.zero_padding(value: Int(self.stopwatch.secCounter)))
                    .fontWeight(.heavy)
                    .padding(15)
                Text(":")
                Text(self.zero_padding(value: Int(self.stopwatch.milsecCounter)))
                    .fontWeight(.heavy)
                    .padding(15)
                }
                .foregroundColor(Color.white)
                .frame(width: geometry.size.width)
                .font(.largeTitle)
            
                HStack{
                    Button(
                        action: {self.stopwatch.reset()},
                        label: {
                            Text(self.ResetLabel)
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                        })
                        .frame(width: geometry.size.width / 4, height: geometry.size.width / 3)
                        .overlay(
                            Circle().stroke(Color.black, lineWidth: 1))
                        .background(Color(red: 0.22, green: 0.22, blue: 0.22, opacity: 1.0))
                        .clipShape(Circle())
                        .frame(width: geometry.size.width / 4.5, height: geometry.size.width / 3.5)
                        .overlay(
                            Circle().stroke(Color.black, lineWidth: 2))
                        .padding()
                    Spacer()
                    Button(
                        action: {
                            if !self.isPlaying{
                                self.stopwatch.start()
                                self.isPlaying = true
                                self.ButtonLabel = "Stop"
                                self.switchStopColor()
                                self.StartStopColor = Color.red
                            }
                            else{
                                self.stopwatch.stop()
                                self.isPlaying = false
                                self.ButtonLabel = "Start"
                                self.switchStartColor()
                                self.StartStopColor = Color.green
                            }
                    },
                        label: {
                            Text(self.ButtonLabel)
                            .foregroundColor(self.StartStopColor)
                            .fontWeight(.bold)
                        }
                    )
                    .frame(width: geometry.size.width / 4, height: geometry.size.width / 3)
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 1))
                    .background(Color(red: self.rcolor, green: self.gcolor, blue: self.bcolor, opacity: 1.0))
                    .clipShape(Circle())
                    .frame(width: geometry.size.width / 4.5, height: geometry.size.width / 3.5)
                    .overlay(
                        Circle().stroke(Color.black, lineWidth: 2))
                    .padding()
                    }
                }
            }
        }
    }
}

struct WatchView_Previews: PreviewProvider {
    static var previews: some View {
        WatchView()
    }
}
