//
//  LauncheDetailsView.swift
//  Spacex
//
//  Created by Александра Широкова on 17.04.2022.
//

import SwiftUI

struct LauncheDetailsView: View {
    var viewModel: LauncheDetailsViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .foregroundColor(Color.blackBrown)
            .frame(height: 100)
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.launcheName)
                        .font(.custom("LabGrotesque-Regular", size: 20))
                        .foregroundColor(Color.white)
                    Text(viewModel.launcheDate)
                        .font(.custom("LabGrotesque-Regular", size: 16))
                        .foregroundColor(Color.greyCrayola)
                }
                Spacer()
                SuccessImageView(success: viewModel.success)
            }
            .padding(.all, 24)
        }
    }
}

struct LauncheDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LauncheDetailsView(viewModel: LauncheDetailsViewModel(launche: Launche.getLaunche()))
            .preferredColorScheme(.dark)
    }
}
