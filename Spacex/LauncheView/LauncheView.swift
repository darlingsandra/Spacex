//
//  LauncheView.swift
//  Spacex
//
//  Created by Александра Широкова on 17.04.2022.
//

import SwiftUI

struct LauncheView: View {
    @ObservedObject private var viewModel = LauncheViewModel()

    var rocketName: String
    var rocketID: String
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear { viewModel.getLaunches(for: rocketID) }
        case .loading:
            ProgressView {
                Text("Загрузка...")
                    .font(.title)
            }
        case .failed(_):
            Text("Что-то пошло не так...")
                .font(.title)
        case .loaded:
            List(viewModel.rows, id: \.launcheID) { launcheVM in
                LauncheDetailsView(viewModel: launcheVM)
            }
            .listStyle(.plain)
            .navigationBarTitle(rocketName, displayMode: .inline)
        }
    }
}

struct LauncheView_Previews: PreviewProvider {
    static var previews: some View {
        LauncheView(rocketName: "Falcon", rocketID: "5e9d0d95eda69955f709d1eb")
            .preferredColorScheme(.dark)
    }
}
