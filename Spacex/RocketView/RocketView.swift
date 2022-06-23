//
//  RocketView.swift
//  Spacex
//
//  Created by Александра Широкова on 14.04.2022.
//

import SwiftUI

struct RocketView: View {
    @StateObject private var viewModel = RocketViewModel()
    
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
               NavigationView {
                   TabView {
                        ForEach(viewModel.pages, id: \.rocketName) { rocketPageVM in
                            RocketPageView(viewModel: rocketPageVM)
                        }
                   }
                   .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                   .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RocketView()
            .preferredColorScheme(.dark)
    }
}
