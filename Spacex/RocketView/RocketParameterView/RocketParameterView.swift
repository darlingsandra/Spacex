//
//  RocketParameterView.swift
//  Spacex
//
//  Created by Александра Широкова on 17.04.2022.
//

import SwiftUI

struct RocketParameterView: View {
    var title: String
    var value: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32)
                .foregroundColor(Color.blackBrown)
            .frame(width: 96, height: 96)
            VStack {
                Text(value)
                    .font(.custom("LabGrotesque-Bold", size: 16))
                    .foregroundColor(Color.white)
                Text(title)
                    .font(.custom("LabGrotesque-Regular", size: 14))
                    .foregroundColor(Color.greyCrayola)
            }
        }
    }
}

struct RocketParameterView_Previews: PreviewProvider {
    static var previews: some View {
        RocketParameterView(title: "Высота, ft", value: "229,6")
            .preferredColorScheme(.dark)
    }
}
