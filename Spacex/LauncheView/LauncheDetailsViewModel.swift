//
//  LauncheDetailsViewModel.swift
//  Spacex
//
//  Created by Александра Широкова on 17.04.2022.
//

import Foundation

class LauncheDetailsViewModel {
    
    var launcheName: String {
        launche.name
    }
    
    var success: Bool {
        launche.success ?? false
    }
    
    var launcheDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let date = dateFormatter.date(from: launche.dateUtc) {
            dateFormatter.dateFormat = "d MMMM', 'yyyy"
            return dateFormatter.string(from: date)
        }
        return launche.dateUtc
    }
    
    private let launche: Launche
    
    init(launche: Launche) {
        self.launche = launche
    }
}
