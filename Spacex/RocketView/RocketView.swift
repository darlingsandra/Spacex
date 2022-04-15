//
//  ContentView.swift
//  Spacex
//
//  Created by Александра Широкова on 14.04.2022.
//

import SwiftUI

struct RocketView: View {
    @ObservedObject private var viewModel = RocketViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear(perform: viewModel.getRocket)
        case .loading:
            ProgressView("Загрузка...")
        case .failed(_):
            Text("Что-то пошло не так...")
                .font(.title)
        case .loaded:
            List(viewModel.rockets, id: \.id) { rocket in
                Text(rocket.name)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RocketView()
    }
}
