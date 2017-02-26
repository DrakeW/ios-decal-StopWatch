//
//  Stopwatch.swift
//  StopWatch
//
//  Created by Junyu Wang on 2/16/17.
//  Copyright © 2017 Junyu Wang. All rights reserved.
//

import Foundation

class Stopwatch {
    var timer: Timer?
    var startTime: Date?
    
    func startTimer(timer: Timer) {
        self.timer = timer
        self.startTime = Date()
    }
    
    func stopTimer() {
        if let t = self.timer {
            t.invalidate()
        }
    }
    
    func getElapsedTime() -> TimeInterval {
        return (self.startTime?.timeIntervalSinceNow)!
    }
}
