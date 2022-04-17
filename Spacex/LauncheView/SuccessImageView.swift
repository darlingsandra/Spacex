//
//  SuccessImageView.swift
//  Spacex
//
//  Created by Александра Широкова on 17.04.2022.
//

import SwiftUI

struct SuccessImageView: View {
    var success: Bool
    
    var body: some View {
        if success {
            Image(systemName: "checkmark.circle")
                .resizable()
                .foregroundColor(Color.white)
                .background(Color.green)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.green, style: StrokeStyle(lineWidth: 7)))
                .frame(width: 40, height: 40)
        } else {
            Image(systemName: "xmark.circle.fill")
                .renderingMode(.original)
                .resizable()
                .frame(width: 40, height: 40)
        }
    }
}

struct SuccessImageView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessImageView(success: true)
            .preferredColorScheme(.dark)
    }
}
