//
//  SettingsView.swift
//  Spacex
//
//  Created by Александра Широкова on 24.06.2022.
//

import SwiftUI

enum MeasureUnit: String {
    case m, ft, kg, lb
}

enum StorageKeys: String {
    case unitHeight, unitDiameter, unitMass, unitPayloadWeights
}

struct SettingsView: View {
    @Binding var isPresented: Bool
    
    @AppStorage(StorageKeys.unitHeight.rawValue) private var height: MeasureUnit = .ft
    @AppStorage(StorageKeys.unitDiameter.rawValue) private var diameter: MeasureUnit = .ft
    @AppStorage(StorageKeys.unitMass.rawValue) private var mass: MeasureUnit = .kg
    @AppStorage(StorageKeys.unitPayloadWeights.rawValue) private var payloadWeights: MeasureUnit = .lb
    
    var body: some View {
        NavigationView {
            VStack {
                SettingsRowView(value: $height, title: "Высота", units: [.m, .ft])
                SettingsRowView(value: $diameter, title: "Диаметр", units: [.m, .ft])
                SettingsRowView(value: $mass, title: "Масса", units: [.kg, .lb])
                SettingsRowView(value: $payloadWeights, title: "Полезная нагрузка", units: [.kg, .lb])
                Spacer()
            }
            .navigationBarTitle("Настройки", displayMode: .inline)
            .navigationBarItems(trailing: ClosedButtonView(isPresented: $isPresented))
            .padding([.bottom, .leading, .trailing])
            .padding([.top], 56)
        }.onAppear {
            updateUI()
        }
    }
    
    private func updateUI() {
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont.systemFont(ofSize: 16)]
    }
}

struct ClosedButtonView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Button(action: { isPresented.toggle() }) {
            Text("Закрыть")
                .foregroundColor(.white)
                .bold()
        }
    }
}

struct SetingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(true))
            .preferredColorScheme(.dark)
    }
}
