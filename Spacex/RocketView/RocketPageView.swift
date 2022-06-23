//
//  RocketPageView.swift
//  Spacex
//
//  Created by Александра Широкова on 15.04.2022.
//

import SwiftUI

struct RocketPageView: View {
    var viewModel: RocketPageViewModel
    
    var body: some View {
        
        ZStack(alignment: .top) {
            RocketImageView(imageData: viewModel.imageData)
            ZStack {
                Rectangle()
                    .foregroundColor(Color.black)
                    .cornerRadius(40, corners: [.topLeft, .topRight])
                ScrollView {
                    HStack {
                        Text(viewModel.rocketName)
                            .font(.title)
                            .foregroundColor(Color.smokyWhite)
                            .padding([.bottom, .top])
                        Spacer()
                    }.padding([.leading, .trailing], 32)
                    VStack(spacing: 40) {
                        RocketParameterListView(viwModel: viewModel)
                            .padding(.leading, 32)
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
                                    value: viewModel.costPerLaunch
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
                        }.padding([.leading, .trailing], 32)
                    }
                    .padding(.bottom, 80)
                }
                .padding(.top)
            }.padding(.top, 248)
       }
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RocketDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RocketPageView(viewModel: RocketPageViewModel(rocket: Rocket.getRocket()))
            .preferredColorScheme(.dark)
    }
}
