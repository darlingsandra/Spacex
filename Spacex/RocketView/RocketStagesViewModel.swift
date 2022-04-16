//
//  RocketStagesViewModel.swift
//  Spacex
//
//  Created by Александра Широкова on 16.04.2022.
//

import Foundation

class RocketStagesViewModel {
    
    var engines: Int {
        stage.engines
    }
    
    var fuelAmountTons: Double {
        stage.fuelAmountTons
    }
    
    var burnTimeSec: Int {
        stage.burnTimeSec ?? 0
    }
    
    private let stage: Stage
    
    init(stage: Stage) {
        self.stage = stage
    }
}
