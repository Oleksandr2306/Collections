//
//  CustomTimer.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 19.08.2022.
//

import Foundation

final class CustomTimer {
    private var timer = Timer()
    var totalTime: Double = 0
    
    func start() {
        totalTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.totalTime += 0.1
        }
    }
    
    func stop() {
        timer.invalidate()
    }
}

