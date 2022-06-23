//
//  Rocket.swift
//  Spacex
//
//  Created by Александра Широкова on 14.04.2022.
//

import Foundation

struct Rocket: Decodable {
    var id: String
    let name: String
    let flickrImages: [String]
    let firstFlight: String
    let country: String
    let costPerLaunch: Int
    
    let firstStage: Stage
    let secondStage: Stage
    
    let height: UnitLenght
    let diameter: UnitLenght
    let mass: UnitMass
    let payloadWeights: [PayloadWeights]
    
    static func getRocketStage() -> Stage {
        Stage(engines: 1, fuelAmountTons: 44.3, burnTimeSec: 169)
    }
    
    static func getRocket() -> Rocket {
        
        let firstStage = Stage(engines: 1, fuelAmountTons: 44.3, burnTimeSec: 169)
        let secondStage = Stage(engines: 1, fuelAmountTons: 3.35, burnTimeSec: 378)
        
        let height = UnitLenght(meters: 22.25, feet: 73)
        let diameter = UnitLenght(meters: 1.68, feet: 5.5)
        let mass = UnitMass(kg: 30146, lb: 66460)
        let payloadWeights = PayloadWeights(id: "leo", name: "Low Earth Orbit", kg: 450, lb: 992)
        
        return Rocket(
            id: UUID().uuidString,
            name: "Falcon 1",
            flickrImages: ["https://imgur.com/DaCfMsj.jpg"],
            firstFlight: "2006-03-24",
            country: "Republic of the Marshall Islands",
            costPerLaunch: 6700000,
            firstStage: firstStage,
            secondStage: secondStage,
            height: height,
            diameter: diameter,
            mass: mass,
            payloadWeights: [payloadWeights]
        )
    }
}

struct UnitLenght: Decodable {
    let meters: Double
    let feet: Double
}

struct UnitMass: Decodable {
    let kg: Double
    let lb: Double
}

struct Stage: Decodable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSec: Int?
}

struct PayloadWeights: Decodable {
    let id: String
    let name: String
    let kg: Int
    let lb: Int
}

enum Status {
    case idle
    case loading
    case failed(NetworkError)
    case loaded
}
