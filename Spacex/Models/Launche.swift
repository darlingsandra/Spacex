//
//  Launche.swift
//  Spacex
//
//  Created by Александра Широкова on 17.04.2022.
//

import Foundation

struct Launche: Decodable {
    let id: String
    let name: String
    let dateUtc: String
    let rocket: String
    let success: Bool?
    
    static func getLaunche() -> Launche {
        Launche(
            id: "5eb87cd9ffd86e000604b32a",
            name: "FalconSat",
            dateUtc: "2006-03-24T22:30:00.000Z",
            rocket: "5e9d0d95eda69955f709d1eb",
            success: true
        )
    }
}
