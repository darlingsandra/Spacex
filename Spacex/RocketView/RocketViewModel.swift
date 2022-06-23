//
//  RocketViewModel.swift
//  Spacex
//
//  Created by Александра Широкова on 15.04.2022.
//

import Foundation

class RocketViewModel: ObservableObject {
    @Published private(set) var pages: [RocketPageViewModel] = []
    @Published private(set) var state = Status.idle
    
    private var rockets: [Rocket] = []
        
    func getCurrentRocketImageDate(_ index: Int) -> Data? {
        guard rockets.endIndex > index, let imageURL = rockets[index].flickrImages.first(where: { _ in true }) else { return nil }
        return NetworkManager.shared.fetchImage(from: imageURL)
    }

    func getRocket() {
        state = .loading
        
        NetworkManager.shared.fetch(dataType: Rocket.self, from: API.rocketsURL.rawValue) { result in
            switch result {
            case .success(let rockets):
                self.state = .loaded
                self.rockets = rockets
                rockets.forEach { self.pages.append(RocketPageViewModel(rocket: $0)) }
            case .failure(let error):
                self.state = .failed(error)
            }
        }
    }
}
