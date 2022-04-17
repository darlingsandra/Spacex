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
        
        ZStack(alignment: .top) {
            RocketImageView(imageData: viewModel.imageData)
            ZStack {
                RoundedRectangle(cornerRadius: 40).foregroundColor(Color.black)
                ScrollView {
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
                            NavigationLink {
                                LauncheView(rocketName: viewModel.rocketName, rocketID: viewModel.rocketID)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(width: 311, height: 56)
                                        .foregroundColor(Color.blackBrown)
                                    Text("Посмотреть запуски")
                                        .font(.custom("LabGrotesque-Bold", size: 18))
                                        .foregroundColor(Color.smokyWhite)
                                }
                            }
                        }
                    }
                    .padding([.leading, .trailing, .top], 32)
                    .padding(.bottom, 80)
                }
                .padding(.top)
            }.padding(.top, 248)
       }
    }
}

struct RocketDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailsView(viewModel: RocketDetailsViewModel(rocket: Rocket.getRocket()))
            .preferredColorScheme(.dark)
    }
}
