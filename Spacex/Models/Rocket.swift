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
