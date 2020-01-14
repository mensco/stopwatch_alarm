//
//  StopWatch.swift
//  StopWatch
//
//  Created by Katsuya Terahata on 2020/01/09.
//  Copyright © 2020 Katsuya Terahata. All rights reserved.
//

import Foundation
import SwiftUI

class StopWatch: ObservableObject{

    @Published var milsecCounter: Double = 0
    @Published var secCounter: Double = 0
    @Published var minCounter: Double = 0
    @Published var lapList: [Double] = []
    var counter: Double = 0
    
    var timer = Timer() // make the instance from Timer class in swift

    func start(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 1 / 100, repeats: true ) { timer in
            self.counter += 1
            let totalmilsecCounter = self.counter * 10
            self.milsecCounter = Double((Int(totalmilsecCounter) % 1000) / 10)
            let totalsecCounter = totalmilsecCounter / 1000
            self.secCounter = Double(Int(totalsecCounter) % 60)
            self.minCounter = totalsecCounter / 60
        }
    }
    
    func stop(){
        timer.invalidate()
    }
    
    func reset(){
        counter = 0
        milsecCounter = 0
        secCounter = 0
        minCounter = 0
        timer.invalidate()
    }
}
