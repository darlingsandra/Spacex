//
//  RocketParameterListView.swift
//  Spacex
//
//  Created by Александра Широкова on 17.04.2022.
//

import SwiftUI

struct RocketParameterListView: View {
    var viwModel: RocketPageViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                RocketParameterView(title: "Высота, ft", value: viwModel.heightFeet)
                RocketParameterView(title: "Диаметр, ft", value: viwModel.diameterFeet)
                RocketParameterView(title: "Масса, lb", value: viwModel.massLb)
                RocketParameterView(title: "Нагрузка, lb", value: viwModel.payloadWeight)
            }
        }
    }
}

struct RocketParameterListView_Previews: PreviewProvider {
    static var previews: some View {
        RocketParameterListView(viwModel: RocketPageViewModel(rocket: Rocket.getRocket()))
            .preferredColorScheme(.dark)
    }
}
