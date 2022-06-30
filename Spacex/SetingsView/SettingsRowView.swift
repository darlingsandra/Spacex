//
//  SettingsRowView.swift
//  Spacex
//
//  Created by Александра Широкова on 27.06.2022.
//

import SwiftUI

struct SettingsRowView: View {
    @Binding var value: MeasureUnit
    let title: String
    let units: [MeasureUnit]
        
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Picker("Settings", selection: $value) {
                ForEach(units, id: \.self) { unit in
                    Text(unit.rawValue).tag(unit)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 115, height: 40)
        }.onAppear {
            updateUI()
        }
    }
        
    private func updateUI() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().backgroundColor = UIColor(.blackBrown)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(.almostBlack)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(.greyCrayola)], for: .normal)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(value: .constant(MeasureUnit.ft), title: "Высота", units: [.m, .ft])
            .preferredColorScheme(.dark)
    }
}
