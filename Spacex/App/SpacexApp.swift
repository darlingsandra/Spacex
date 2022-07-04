//
//  SpacexApp.swift
//  Spacex
//
//  Created by Александра Широкова on 14.04.2022.
//

import SwiftUI

@main
struct SpacexApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RocketView()
                .edgesIgnoringSafeArea(.all)  
                .preferredColorScheme(.dark)
        }
    }
}


