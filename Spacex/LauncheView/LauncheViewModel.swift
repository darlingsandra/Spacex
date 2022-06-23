//
//  LauncheViewModel.swift
//  Spacex
//
//  Created by Александра Широкова on 17.04.2022.
//

import Foundation

class LauncheViewModel: ObservableObject {
    @Published private(set) var launches: [Launche] = []
    @Published private(set) var state = Status.idle
    
    func getLaunches() {
        state = .loading
        
        NetworkManager.shared.fetch(dataType: Launche.self, from: API.launchesURL.rawValue) { result in
            switch result {
            case .success(let launches):
                self.state = .loaded
                self.launches = launches
            case .failure(let error):
                self.state = .failed(error)
                print(error)
            }
        }
    }
}
