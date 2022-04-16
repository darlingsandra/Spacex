//
//  RocketDetailsRowView.swift
//  Spacex
//
//  Created by Александра Широкова on 16.04.2022.
//

import SwiftUI

struct RocketDetailsRowView: View {
    var title: String
    var value: String
    var unit: String? = nil
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Color.paleGrey)
            Spacer()
            Text(value)
                .foregroundColor(Color.smokyWhite)
            if let unit = unit {
                Text(unit)
                    .foregroundColor(Color.greyCrayola)
                    .frame(width: 28, height: 24)
            }
                
        }
        .font(.custom("LabGrotesque-Regular", size: 16))
    }
}

struct RocketDetailsRowView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailsRowView(
            title: "Количество топлива",
            value: "44.3",
            unit: "ton"
        )
        .preferredColorScheme(.dark)
    }
}
