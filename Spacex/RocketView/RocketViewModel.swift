//
//  RocketViewModel.swift
//  Spacex
//
//  Created by Александра Широкова on 15.04.2022.
//

import Foundation

class RocketViewModel: ObservableObject {
    @Published private(set) var pages: [RocketPageViewModel] = []
    @Published private(set) var state = State.idle
    
    func getRocket() {
        state = .loading
        
        NetworkManager.shared.fetch(dataType: Rocket.self, from: API.rocketsURL.rawValue) { result in
            switch result {
            case .success(let rockets):
                self.state = .loaded
                rockets.forEach { self.pages.append(RocketPageViewModel(rocket: $0)) }
            case .failure(let error):
                self.state = .failed(error)
            }
        }
    }
}
