//
//  ParameterListView.swift
//  Spacex
//
//  Created by Александра Широкова on 17.04.2022.
//

import SwiftUI

struct ParameterListView: View {
    var viwModel: RocketDetailsViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ParameterRocketView(title: "Высота, ft", value: viwModel.heightFeet)
                ParameterRocketView(title: "Диаметр, ft", value: viwModel.diameterFeet)
                ParameterRocketView(title: "Масса, lb", value: viwModel.massLb)
                ParameterRocketView(title: "Нагрузка, lb", value: viwModel.payloadWeight)
            }
        }
    }
}

struct ParameterListView_Previews: PreviewProvider {
    static var previews: some View {
        ParameterListView(viwModel: RocketDetailsViewModel(rocket: Rocket.getRocket()))
            .preferredColorScheme(.dark)
    }
}
