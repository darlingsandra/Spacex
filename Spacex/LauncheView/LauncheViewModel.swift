//
//  LauncheViewModel.swift
//  Spacex
//
//  Created by Александра Широкова on 17.04.2022.
//

import Foundation

class LauncheViewModel: ObservableObject {
    @Published private(set) var rows: [LauncheDetailsViewModel] = []
    @Published private(set) var state = Status.idle
    
    private var launches: [Launche] = []
        
    func getLaunches(for rocketID: String) {
        state = .loading
        
        NetworkManager.shared.fetch(dataType: Launche.self, from: API.launchesURL.rawValue) { result in
            switch result {
            case .success(let launches):
                self.state = .loaded
                self.launches = launches.filter{ $0.rocket == rocketID }
                self.launches.forEach { self.rows.append(LauncheDetailsViewModel(launche: $0)) }
            case .failure(let error):
                self.state = .failed(error)
                print(error)
            }
        }
    }
}
