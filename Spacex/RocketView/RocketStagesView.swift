//
//  RocketStagesView.swift
//  Spacex
//
//  Created by Александра Широкова on 16.04.2022.
//

import SwiftUI

struct RocketStagesView: View {
    var viewModel: RocketStagesViewModel
    
    var body: some View {
        VStack(spacing: 16)  {
            HStack {
                Text("ПЕРВАЯ СТУПЕНЬ")
                    .font(.custom("LabGrotesque-Bold", size: 16))
                    .foregroundColor(Color.smokyWhite)
                Spacer()
            }
            RocketDetailsRowView(
                title: "Количество двигателей",
                value: String(viewModel.engines),
                unit: ""
            )
            RocketDetailsRowView(
                title: "Количество топлива",
                value: String(viewModel.fuelAmountTons),
                unit: "ton"
            )
            RocketDetailsRowView(
                title: "Время сгарания",
                value: String(viewModel.burnTimeSec),
                unit: "sec"
            )
        }
    }
}

struct RocketStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RocketStagesView(viewModel: RocketStagesViewModel(stage: Rocket.getRocketStage()))
            .preferredColorScheme(.dark)
    }
}
