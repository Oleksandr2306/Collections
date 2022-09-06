//
//  CustomTimer.swift
//  Collections
//
//  Created by Oleksandr Melnyk on 19.08.2022.
//

import Foundation

final class CollectionsOperationTimer {
    private var timer = Timer()
    private(set) var totalTime: Double = 0
    
    func start() {
        totalTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.totalTime += 0.01
        }
    }
    
    func stop() {
        timer.invalidate()
    }
}

