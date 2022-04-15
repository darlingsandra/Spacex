//
//  RocketViewModel.swift
//  Spacex
//
//  Created by Александра Широкова on 15.04.2022.
//

import Foundation

class RocketViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case failed(NetworkError)
        case loaded
    }
    
    @Published private(set) var rockets: [Rocket] = []
    @Published private(set) var state = State.idle
    
    func getRocket() {
        state = .loading
        
        NetworkManager.shared.fetch(dataType: Rocket.self, from: API.rocketsURL.rawValue) { result in
            switch result {
            case .success(let rockets):
                self.state = .loaded
                self.rockets = rockets
            case .failure(let error):
                self.state = .failed(error)
            }
        }
    }
}
