//
//  RocketView.swift
//  Spacex
//
//  Created by Александра Широкова on 14.04.2022.
//

import SwiftUI

struct RocketView: View {
    @State var pageIndex = 0
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
                   ZStack {
                       RocketImageView(imageData: viewModel.getCurrentRocketImageDate(pageIndex))
                       TabView(selection: $pageIndex) {
                           ForEach(Array(viewModel.pages.enumerated()), id: \.offset) { index, rocketPageVM in
                               ZStack {
                                   RocketPageView(viewModel: rocketPageVM).tag(index)
                                   BarTabView()
                               }
                               .edgesIgnoringSafeArea(.bottom)
                           }
                       }
                       .navigationBarHidden(true)
                       .edgesIgnoringSafeArea(.bottom)
                       .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                   }
                   .edgesIgnoringSafeArea([.bottom, .top])
               }
        }
    }
}

struct BarTabView: View {
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .foregroundColor(.almostBlack)
                .frame(height: 72)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RocketView()
           .preferredColorScheme(.dark)
    }
}
