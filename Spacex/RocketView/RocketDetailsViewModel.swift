//
//  RocketDetailsViewModel.swift
//  Spacex
//
//  Created by Александра Широкова on 15.04.2022.
//

import Foundation

class RocketDetailsViewModel {
    
    var rocketName: String {
        rocket.name
    }
    
    var firstFlight: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
        if let date = dateFormatter.date(from: rocket.firstFlight) {
            print(date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d MMMM', 'yyyy"
            return dateFormatter.string(from: date)
        }
        
        return rocket.firstFlight
    }
    
    var country: String {
        rocket.country
    }
    
    var costPerLaunch: Int {
        rocket.costPerLaunch
    }
    
    var firstStageVM: RocketStagesViewModel {
        RocketStagesViewModel(stage: rocket.firstStage)
    }
    
    var secondStageVM: RocketStagesViewModel {
        RocketStagesViewModel(stage: rocket.secondStage)
    }
    
    var imageData: Data? {
        guard let imageURL = rocket.flickrImages.first(where: { _ in true }) else { return nil }
        return NetworkManager.shared.fetchImage(from: imageURL)
    }
    
    private let rocket: Rocket
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
}
