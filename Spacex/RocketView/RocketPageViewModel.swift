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
        String(rocket.costPerLaunch)
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
        return formatNumber(Int(massValue))
    }
    
    func getPayloadWeightTitle(for setting: MeasureUnit) -> String {
        "Нагрузка, \(setting.rawValue)"
    }
    
    func getPayloadWeightValue(for setting: MeasureUnit) -> String {
        let payloads = rocket.payloadWeights.filter { $0.id == "leo" }
        if let payload = payloads.first {
            let payloadWeightValue = setting == MeasureUnit.kg ? payload.kg : payload.lb
            return formatNumber(payloadWeightValue)
        }
        return "0"
    }
    
    private func formatNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        let nsNumber = NSNumber(value: number)
        return formatter.string(from: nsNumber) ?? ""
    }
}
