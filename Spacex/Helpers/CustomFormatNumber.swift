//
//  CustomFormatNumber.swift
//  Spacex
//
//  Created by Александра Широкова on 05.07.2022.
//

import Foundation

protocol CustomFormatNumber: Numeric {
    func formatNumber(minimumFractionDigits: Int, decimalSeparator: String, groupingSeparator: String) -> String
}

extension Int: CustomFormatNumber {}
extension Double: CustomFormatNumber {}

extension CustomFormatNumber {
    func formatNumber(minimumFractionDigits: Int = 0, decimalSeparator: String = ".", groupingSeparator: String = ",") -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = minimumFractionDigits
        formatter.decimalSeparator = decimalSeparator
        formatter.groupingSeparator = groupingSeparator
        return formatter.string(for: self) ?? ""
    }
}
