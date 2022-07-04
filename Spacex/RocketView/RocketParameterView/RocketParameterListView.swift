//
//  RocketParameterListView.swift
//  Spacex
//
//  Created by Александра Широкова on 17.04.2022.
//

import SwiftUI

struct RocketParameterListView: View {
    var viewModel: RocketPageViewModel
    
    @AppStorage(StorageKeys.unitHeight.rawValue) private var height: MeasureUnit = .ft
    @AppStorage(StorageKeys.unitDiameter.rawValue) private var diameter: MeasureUnit = .ft
    @AppStorage(StorageKeys.unitMass.rawValue) private var mass: MeasureUnit = .kg
    @AppStorage(StorageKeys.unitPayloadWeights.rawValue) private var payloadWeights: MeasureUnit = .lb
        
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                RocketParameterView(
                    title: viewModel.getHeightTitle(for: height),
                    value: viewModel.getHeightValue(for: height)
                )
                RocketParameterView(
                    title: viewModel.getDiameterTitle(for: diameter),
                    value: viewModel.getDiameterValue(for: diameter)
                )
                RocketParameterView(
                    title: viewModel.getMassTitle(for: mass),
                    value: viewModel.getMassValue(for: mass)
                )
                RocketParameterView(
                    title: viewModel.getPayloadWeightTitle(for: payloadWeights),
                    value: viewModel.getPayloadWeightValue(for: payloadWeights)
                )
            }
        }
    }
}

struct RocketParameterListView_Previews: PreviewProvider {
    static var previews: some View {
        RocketParameterListView(viewModel: RocketPageViewModel(rocket: Rocket.getRocket()))
            .preferredColorScheme(.dark)
    }
}
