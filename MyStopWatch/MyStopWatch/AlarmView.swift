//
//  AlarmView.swift
//  MyStopWatch
//
//  Created by Katsuya Terahata on 2020/01/09.
//  Copyright © 2020 Katsuya Terahata. All rights reserved.
//

import SwiftUI
import AVKit

struct AlarmView: View {
    @State var isAlarmOn = false
    @State var audioPlayer: AVAudioPlayer!
    
    func alarmPlay(alarmON:Bool){
        if alarmON{
            self.audioPlayer.play()
            }
    }
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            GeometryReader{ geometry in
                VStack{
                    Toggle(isOn: self.$isAlarmOn) {
                        HStack{
                            Text("Alarm")
                                .font(.title)
                                .foregroundColor(Color.white)
                            Button(
                                action: {self.alarmPlay(alarmON: self.isAlarmOn)},
                                label: {
                                    Image(systemName: "play.circle.fill").resizable()
                                        .frame(width:30, height: 30)
                                        .foregroundColor(Color.white)
                                    }
                                )
                            Button(
                                action: {self.audioPlayer.pause()},
                                label: {
                                    Image(systemName: "pause.circle.fill").resizable()
                                        .frame(width:30, height: 30)
                                        .foregroundColor(Color.white)
                                    }
                                )
                        }
                    }.padding()
                    }
                }
        }.onAppear{
            let sound = Bundle.main.path(forResource: "alarm", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
