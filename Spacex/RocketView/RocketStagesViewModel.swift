//
//  RocketStagesViewModel.swift
//  Spacex
//
//  Created by Александра Широкова on 16.04.2022.
//

import Foundation

class RocketStagesViewModel {
    
    var engines: String {
        String(stage.engines)
    }
    
    var fuelAmountTons: String {
        stage.fuelAmountTons.formatNumber(minimumFractionDigits: 1, decimalSeparator: ",", groupingSeparator: " ")
    }
    
    var burnTimeSec: String {
        guard let burnTimeSec = stage.burnTimeSec else { return "" }
        return String(burnTimeSec)
    }
    
    private let stage: Stage
    
    init(stage: Stage) {
        self.stage = stage
    }
}
