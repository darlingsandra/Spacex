//
//  RocketPageViewModel.swift
//  Spacex
//
//  Created by Александра Широкова on 15.04.2022.
//

import SwiftUI

class RocketPageViewModel {
    
    var rocketName: String {
        rocket.name
    }
    
    var rocketID: String {
        rocket.id
    }
    
    var firstFlight: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
        if let date = dateFormatter.date(from: rocket.firstFlight) {
            dateFormatter.dateFormat = "d MMMM', 'yyyy"
            return dateFormatter.string(from: date)
        }
        return rocket.firstFlight
    }
    
    var country: String {
        rocket.country
    }
    
    var costPerLaunch: String {
        var costPerLaunch = rocket.costPerLaunch
        var unit = ""
        
        switch rocket.costPerLaunch {
        case let number where number >= 1000000000:
            costPerLaunch = number / 1000000000; unit = "млрд"
        case let number where number >= 1000000:
            costPerLaunch = number / 1000000; unit = "млн"
        case let number where number >= 1000:
            costPerLaunch = number / 1000; unit = "тыс"
        default:
            costPerLaunch = rocket.costPerLaunch; unit = ""
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        formatter.currencyCode = "USD"
        formatter.maximumFractionDigits = 0
        let costPerLaunchString = formatter.string(from: NSNumber(value: costPerLaunch)) ?? ""

        return "\(costPerLaunchString) \(unit)"
    }
    
    var firstStageVM: RocketStagesViewModel {
        RocketStagesViewModel(stage: rocket.firstStage)
    }
    
    var secondStageVM: RocketStagesViewModel {
        RocketStagesViewModel(stage: rocket.secondStage)
    }
    
    private let rocket: Rocket
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
    
    func getHeightTitle(for setting: MeasureUnit) -> String {
        "Высота, \(setting.rawValue)"
    }
    
    func getHeightValue(for setting: MeasureUnit) -> String {
        let heightValue = setting == MeasureUnit.m ? rocket.height.meters : rocket.height.feet
        return String(heightValue)
    }
    
    func getDiameterTitle(for setting: MeasureUnit) -> String {
        "Диаметр, \(setting.rawValue)"
    }
    
    func getDiameterValue(for setting: MeasureUnit) -> String {
        let diameterValue = setting == MeasureUnit.m ? rocket.diameter.meters : rocket.diameter.feet
        return String(diameterValue)
    }
    
    func getMassTitle(for setting: MeasureUnit) -> String {
        "Масса, \(setting.rawValue)"
    }
    
    func getMassValue(for setting: MeasureUnit) -> String {
        let massValue = setting == MeasureUnit.kg ? rocket.mass.kg : rocket.mass.lb
        return massValue.formatNumber()
    }
    
    func getPayloadWeightTitle(for setting: MeasureUnit) -> String {
        "Нагрузка, \(setting.rawValue)"
    }
    
    func getPayloadWeightValue(for setting: MeasureUnit) -> String {
        let payloads = rocket.payloadWeights.filter { $0.id == "leo" }
        if let payload = payloads.first {
            let payloadWeightValue = setting == MeasureUnit.kg ? payload.kg : payload.lb
            return payloadWeightValue.formatNumber()
        }
        return "0"
    }
}

