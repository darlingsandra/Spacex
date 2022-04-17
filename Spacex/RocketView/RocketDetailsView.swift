//
//  RocketDetailsView.swift
//  Spacex
//
//  Created by Александра Широкова on 15.04.2022.
//

import SwiftUI

struct RocketDetailsView: View {
    var viewModel: RocketDetailsViewModel
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        ScrollView {
            ZStack {
                RocketImageView(imageData: viewModel.imageData)
                VStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(Color.black)
                        VStack {
                            HStack {
                                Text(viewModel.rocketName)
                                    .font(.title)
                                    .foregroundColor(Color.smokyWhite)
                                    .padding([.bottom, .top])
                                Spacer()
                            }
                            VStack(spacing: 40) {
                                VStack(spacing: 16) {
                                    RocketDetailsRowView(
                                        title: "Первый запуск",
                                        value: viewModel.firstFlight
                                    )
                                    RocketDetailsRowView(
                                        title: "Страна",
                                        value: viewModel.country
                                    )
                                    RocketDetailsRowView(
                                        title: "Стоимость запуска",
                                        value: String(viewModel.costPerLaunch)
                                    )
                                }
                                RocketStagesView(viewModel: viewModel.firstStageVM, title: "ПЕРВАЯ СТУПЕНЬ")
                                RocketStagesView(viewModel: viewModel.secondStageVM, title: "ВТОРАЯ СТУПЕНЬ")
                                Button(action: {}) {
                                    Text("Посмотреть запуски")
                                        .font(.custom("LabGrotesque-Bold", size: 18))
                                        .foregroundColor(Color.smokyWhite)
                                }
                                .frame(width: 311, height: 56)
                                .background(Color.blackBrow)
                                .cornerRadius(12)
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                    }
                    .frame(width: screenSize.width, height: screenSize.height / 3 * 2)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct RocketDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailsView(viewModel: RocketDetailsViewModel(rocket: Rocket.getRocket()))
            .preferredColorScheme(.dark)
    }
}
